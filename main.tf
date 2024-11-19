
module "vpc" {
  source = "./modules/vpc"

  identifier     = var.identifier

  vpc_cidr_block = var.vpc_cidr_block
  vpc_name       = var.vpc_name

  public_subnets_cidr_block = var.public_subnets_cidr_block
  public_subnets_name       = var.public_subnets_name

  application_subnets_cidr_block = var.application_subnets_cidr_block
  application_subnets_name       = var.application_subnets_name

  data_subnets_cidr_block = var.data_subnets_cidr_block
  data_subnets_name       = var.data_subnets_name

  IGW_name       = var.IGW_name
  cidr_route_igw = var.cidr_route_igw

  public_RT_name      = var.public_RT_name

  application_RT_name = var.application_RT_name

  data_RT_name        = var.data_RT_name 
}