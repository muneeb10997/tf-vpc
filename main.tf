provider "aws" {
  region = "us-east-1"
}

module "My_Vpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
}