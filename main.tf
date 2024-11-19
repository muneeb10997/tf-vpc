
module "vpc" {
  source = "./modules/vpc"

  identifier     = var.identifier
  
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name       = var.vpc_name

  public_subnets_cidr_block = var.public_subnets_cidr_block

  application_subnets_cidr_block = var.application_subnets_cidr_block

  data_subnets_cidr_block = var.data_subnets_cidr_block

}