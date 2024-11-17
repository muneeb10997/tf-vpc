provider "aws" {
  region = "us-east-1"
}

module "My_Vpc" {
  source                     = "./modules/vpc"
  vpc_cidr_block             = var.vpc_cidr_block
  vpc_name                   = var.vpc_name
  public_subnet_1_cidr_block = var.public_subnet_1_cidr_block
  public_subnet_1_name       = var.public_subnet_1_name
  IGW_name                   = var.IGW_name
}
