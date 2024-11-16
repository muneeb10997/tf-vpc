provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "My_Vpc" {
  cidr_block = var.cidr_block
}