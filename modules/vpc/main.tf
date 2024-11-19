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
# public subnets creation
resource "aws_subnet" "public_subnets" {
  vpc_id     = aws_vpc.vpc.id
  count      = "${length(var.public_subnets_cidr_block)}"
  cidr_block = "${var.public_subnets_cidr_block[count.index]}"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "${var.identifier}-public_subnets_${count.index}-${terraform.workspace}"
  }
}
# application subnets creation
resource "aws_subnet" "application_subnets" {
  vpc_id     = aws_vpc.vpc.id
  count      = "${length(var.application_subnets_cidr_block)}"
  cidr_block = "${var.application_subnets_cidr_block[count.index]}"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "${var.identifier}-application_subnets_${count.index}-${terraform.workspace}"
  }
}
# data subnets creation
resource "aws_subnet" "data_subnets" {
  vpc_id     = aws_vpc.vpc.id
  count      = "${length(var.data_subnets_cidr_block)}"
  cidr_block = "${var.data_subnets_cidr_block[count.index]}"
  availability_zone = data.aws_availability_zones.available.names[count.index]
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
# Public route table creation and adding internet gateway route
resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.identifier}-${var.public_RT_name}-${terraform.workspace}"
  }
  # route for internet gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
# Application route table creation 
resource "aws_route_table" "application_RT" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.identifier}-${var.application_RT_name}-${terraform.workspace}"
  }
}
# data route table creation 
resource "aws_route_table" "data_RT" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.identifier}-${var.data_RT_name}-${terraform.workspace}"
  }
}
# Public Subnet Route Table with Subnet assosiation
resource "aws_route_table_association" "public-sub-asso" {
  count      = "${length(var.public_subnets_cidr_block)}"
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_RT.id
}
# application Subnet Route Table with Subnet assosiation
resource "aws_route_table_association" "application-sub-asso" {
  count      = "${length(var.application_subnets_cidr_block)}"
  subnet_id      = aws_subnet.application_subnets[count.index].id
  route_table_id = aws_route_table.application_RT.id
}
# data Subnet Route Table with Subnet assosiation
resource "aws_route_table_association" "data-sub-asso" {
  count      = "${length(var.data_subnets_cidr_block)}"
  subnet_id      = aws_subnet.data_subnets[count.index].id
  route_table_id = aws_route_table.data_RT.id
}