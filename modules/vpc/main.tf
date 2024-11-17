provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "My_Vpc" {
  cidr_block = var.vpc_cidr_block
   tags = {
    Name = var.vpc_name
  }

}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.My_Vpc.id
  cidr_block = var.public_subnet_1_cidr_block
  
  tags = {
    Name = var.public_subnet_1_name
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.My_Vpc.id

  tags = {
    Name = var.IGW_name
  }
}
