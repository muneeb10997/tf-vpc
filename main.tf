
module "vpc" {
  source = "./modules/vpc"

  identifier     = var.identifier
  
  vpc_cidr_block = var.vpc_cidr_block

  public_subnets_cidr_block = var.public_subnets_cidr_block

  application_subnets_cidr_block = var.application_subnets_cidr_block

  data_subnets_cidr_block = var.data_subnets_cidr_block
  
  # enable_nat = var.enable_nat
}

module "security_group_1" {
  source                 = "./modules/security-groups"
  identifier = var.identifier
  vpc_id                 = module.vpc.vpc_id
  security_group_name    = var.first_security_group_name
  ingress_rules          = var.first_sg_ingress_rules
  egress_rules           = var.first_sg_egress_rules
}


module "security_group_2" {
  source                 = "./modules/security-groups"
  identifier = var.identifier
  vpc_id                 = module.vpc.vpc_id
  security_group_name    = var.second_security_group_name
  source_security_group_id = module.security_group_1.security_group_id
  ingress_rules          = var.second_sg_ingress_rules
  egress_rules           = var.second_sg_egress_rules
}
# module "ec2" {
#   source = "./modules/ec2"
#   identifier = module.vpc.identifier
#   ami = var.ami
#   instance_type = var.instance_type
#   subnet_id = module.vpc.public_subnets[0].id
#   security_groups = module.security_groups.sg.id
#   key_name = var.key_name
#   name = var.name
#   associate_public_ip_address = var.associate_public_ip_address
# }



