
module "vpc" {
  source = "./modules/vpc"

  identifier     = var.identifier
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name       = var.vpc_name

  public_subnets_cidr_block = var.public_subnets_cidr_block


  application_subnets_cidr_block = var.application_subnets_cidr_block
  

  data_subnets_cidr_block = var.data_subnets_cidr_block
  

  public_RT_name      = var.public_RT_name
  application_RT_name = var.application_RT_name
  data_RT_name        = var.data_RT_name 

  # public_subnet_1_cidr_block = var.public_subnet_1_cidr_block
  # public_subnet_1_name       = var.public_subnet_1_name
  # public_subnet_2_cidr_block = var.public_subnet_2_cidr_block
  # public_subnet_2_name       = var.public_subnet_2_name

  # application_subnet_1_cidr_block = var.application_subnet_1_cidr_block
  # application_subnet_1_name       = var.application_subnet_1_name
  # application_subnet_2_cidr_block = var.application_subnet_2_cidr_block
  # application_subnet_2_name       = var.application_subnet_2_name

  # data_subnet_1_cidr_block = var.data_subnet_1_cidr_block
  # data_subnet_1_name       = var.data_subnet_1_name
  # data_subnet_2_cidr_block = var.data_subnet_2_cidr_block
  # data_subnet_2_name       = var.data_subnet_2_name

}