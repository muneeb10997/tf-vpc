module "vpc" {
  source = "./modules/vpc"

  identifier = var.identifier

  vpc_cidr_block = var.vpc_cidr_block

  public_subnets_cidr_block = var.public_subnets_cidr_block

  application_subnets_cidr_block = var.application_subnets_cidr_block

  data_subnets_cidr_block = var.data_subnets_cidr_block

  # enable_nat = var.enable_nat
}

# using security group module to create security group 
module "public_security_group" {
  source              = "./modules/security-groups"
  identifier          = var.identifier
  vpc_id              = module.vpc.vpc_id
  security_group_name = var.public_security_group_name
  rules               = var.public_sg_rules
}

# using same security group module for creating another security group with different variables
module "application_security_group" {
  source                   = "./modules/security-groups"
  identifier               = var.identifier
  vpc_id                   = module.vpc.vpc_id
  security_group_name      = var.application_security_group_name
  rules                    = var.application_sg_rules
  source_security_group_id = module.public_security_group.security_group_id
  depends_on               = [module.public_security_group]
}



