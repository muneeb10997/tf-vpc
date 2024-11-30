# VPC creation 
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.identifier}-vpc-${terraform.workspace}"
  }
}

# list of all available AWS availability zones 
data "aws_availability_zones" "available" {
  state = "available"
}

# public subnets creation
resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.vpc.id
  count                   = length(var.public_subnets_cidr_block)
  cidr_block              = var.public_subnets_cidr_block[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.identifier}-public_subnets_${count.index}-${terraform.workspace}"
  }
}

# application subnets creation
resource "aws_subnet" "application_subnets" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.application_subnets_cidr_block)
  cidr_block        = var.application_subnets_cidr_block[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]
  tags = {
    Name = "${var.identifier}-application_subnets_${count.index}-${terraform.workspace}"
  }
}

# data subnets creation
resource "aws_subnet" "data_subnets" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.data_subnets_cidr_block)
  cidr_block        = var.data_subnets_cidr_block[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]
  tags = {
    Name = "${var.identifier}-data_subnets_${count.index}-${terraform.workspace}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.identifier}-igw-${terraform.workspace}"
  }
}

# eni for nat gateway
resource "aws_eip" "nat-eip" {
  count  = var.enable_nat == true ? 1 : 0
  domain = "vpc"
  tags = {
    Name = "${var.identifier}-nat_eip-${terraform.workspace}"
  }
}
# nat-gateway
resource "aws_nat_gateway" "nat" {
  count         = var.enable_nat == true ? 1 : 0
  allocation_id = aws_eip.nat-eip[0].id
  subnet_id     = aws_subnet.public_subnets[0].id
  tags = {
    Name = "${var.identifier}-nat-${terraform.workspace}"
  }
  depends_on = [aws_internet_gateway.igw]
}

# Public route table creation and adding internet gateway route
resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.identifier}-public_RT-${terraform.workspace}"
  }
}
#route for internet gateway
resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.public_RT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Application route table creation 
resource "aws_route_table" "application_RT" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.identifier}-application_RT-${terraform.workspace}"
  }
}
# route for nat gateway
resource "aws_route" "nat_route" {
  count                  = var.enable_nat == true ? 1 : 0
  route_table_id         = aws_route_table.application_RT.id
  nat_gateway_id         = aws_nat_gateway.nat[0].id
  destination_cidr_block = "0.0.0.0/0"
}


# data route table creation 
resource "aws_route_table" "data_RT" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.identifier}-data_RT-${terraform.workspace}"
  }
}
resource "aws_route" "route_nat" {
  count                  = var.enable_nat == true ? 1 : 0
  route_table_id         = aws_route_table.data_RT.id
  nat_gateway_id         = aws_nat_gateway.nat[0].id
  destination_cidr_block = "0.0.0.0/0"
}

# Public Subnet Route Table with Subnet assosiation
resource "aws_route_table_association" "public-subnet-assosiation" {
  count          = length(var.public_subnets_cidr_block)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_RT.id
}

# application Subnet Route Table with Subnet assosiation
resource "aws_route_table_association" "application-subnet-assosiation" {
  count          = length(var.application_subnets_cidr_block)
  subnet_id      = aws_subnet.application_subnets[count.index].id
  route_table_id = aws_route_table.application_RT.id
}

# data Subnet Route Table with Subnet assosiation
resource "aws_route_table_association" "data-subnet-assosiation" {
  count          = length(var.data_subnets_cidr_block)
  subnet_id      = aws_subnet.data_subnets[count.index].id
  route_table_id = aws_route_table.data_RT.id
}