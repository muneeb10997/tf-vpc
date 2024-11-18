# VPC creation 
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
   tags = {
    Name = "${var.identifier}-${var.vpc_name}-${terraform.workspace}"
  }

}

# data souce for getting list of avialibility zones
data "aws_availability_zones" "available" {
  state = "available"
}


# Internet Gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.identifier}-${var.IGW_name}-${terraform.workspace}"
  }
}


# Public Subnets creation 
# public subnet 1 
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_1_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.identifier}-${var.public_subnet_1_name}-${terraform.workspace}"
  }
}
# public subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_2_cidr_block
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "${var.identifier}-${var.public_subnet_2_name}-${terraform.workspace}"
  }
}



# Public Subnet Route Table with Subnet assosiation
# Public route table creation and adding internet gateway route
resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.identifier}-${var.public_RT_name}-${terraform.workspace}"
  }
  # route for internet gateway
  route {
    cidr_block = var.cidr_route_igw
    gateway_id = aws_internet_gateway.IGW.id
  }
}

# subnet assosiations (pub-subnet-1 , pub-subnet-2)
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_RT.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_RT.id
}



# Application Subnets creation 
# application subnet 1 
resource "aws_subnet" "application_subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.application_subnet_1_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.identifier}-${var.application_subnet_1_name}-${terraform.workspace}"
  }
}
# application Subnet 2
resource "aws_subnet" "application_subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.application_subnet_2_cidr_block
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "${var.identifier}-${var.application_subnet_2_name}-${terraform.workspace}"
  }
}


# Application Subnet Route Table with Subnet assosiation
# Application route table creation 
resource "aws_route_table" "application_RT" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.identifier}-${var.applicaiton_RT_name}-${terraform.workspace}"
  }
}

# subnet assosiations (app-subnet-1 , app-subnet-2)
resource "aws_route_table_association" "c" {
  
  subnet_id      = aws_subnet.application_subnet_1.id
  route_table_id = aws_route_table.application_RT.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.application_subnet_2.id
  route_table_id = aws_route_table.application_RT.id
}



# data Subnets creation 
# data subnet 1 
resource "aws_subnet" "data_subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.data_subnet_1_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.identifier}-${var.data_subnet_1_name}-${terraform.workspace}"
  }
}
# data Subnet 2
resource "aws_subnet" "data_subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.data_subnet_2_cidr_block
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "${var.identifier}-${var.data_subnet_2_name}-${terraform.workspace}"
  }
}

# data Subnet Route Table with Subnet assosiation
# data route table creation 
resource "aws_route_table" "data_RT" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.identifier}-${var.data_RT_name}-${terraform.workspace}"
  }
}
# subnet assosiations (data-subnet-1 , data-subnet-2)
resource "aws_route_table_association" "e" {
  subnet_id      = aws_subnet.data_subnet_1.id
  route_table_id = aws_route_table.data_RT.id
}
resource "aws_route_table_association" "f" {
  subnet_id      = aws_subnet.data_subnet_2.id
  route_table_id = aws_route_table.data_RT.id
}



