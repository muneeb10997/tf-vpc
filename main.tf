
module "vpc" {
  source = "./modules/vpc"

  identifier     = var.identifier
  
  vpc_cidr_block = var.vpc_cidr_block

  public_subnets_cidr_block = var.public_subnets_cidr_block

  application_subnets_cidr_block = var.application_subnets_cidr_block

  data_subnets_cidr_block = var.data_subnets_cidr_block
  
  # enable_nat = var.enable_nat
}

module "security_groups" {
  source = "./modules/security-groups"
  vpc_id  = module.vpc.vpc_id
  identifier = module.vpc.identifier

  ingress_cidr_blocks_public=var.ingress_cidr_blocks_public
  ingress_from_ports_public=var.ingress_from_ports_public
  ingress_to_ports_public=var.ingress_to_ports_public
  ingress_protocols_public=var.ingress_protocols_public

  ingress_cidr_blocks_application=var.ingress_cidr_blocks_application
  ingress_from_ports_application=var.ingress_from_ports_application
  ingress_to_ports_application=var.ingress_to_ports_application
  ingress_protocols_application=var.ingress_protocols_application

  ingress_cidr_blocks_data=var.ingress_cidr_blocks_data
  ingress_from_ports_data=var.ingress_from_ports_data
  ingress_to_ports_data=var.ingress_to_ports_data
  ingress_protocols_data=var.ingress_protocols_data
}

# module "ec2" {
#   source = "./modules/ec2"
#   identifier = module.vpc.identifier
#   public_subnets_ids = module.vpc.public_subnets_ids
#   public_ec2_sg_id = module.security_groups.public_ec2_sg_id
  
# }



