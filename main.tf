
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
  cidr_ipv4_http = var.cidr_ipv4_http
  cidr_ipv4_https = var.cidr_ipv4_https
  cidr_ipv4_ssh = var.cidr_ipv4_ssh
}

# module "ec2" {
#   source = "./modules/ec2"
#   identifier = module.vpc.identifier
#   public_subnets_ids = module.vpc.public_subnets_ids
#   public_ec2_sg_id = module.security_groups.public_ec2_sg_id
  
# }
