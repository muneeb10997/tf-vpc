# vpc module for creating vpc,subnets,route tables,igw,nat with condition
module "vpc" {
  source                         = "./modules/vpc"
  identifier                     = var.identifier
  vpc_cidr_block                 = var.vpc_cidr_block
  public_subnets_cidr_block      = var.public_subnets_cidr_block
  application_subnets_cidr_block = var.application_subnets_cidr_block
  data_subnets_cidr_block        = var.data_subnets_cidr_block
  enable_nat                     = var.enable_nat
}

#public-sg
module "public_security_group" {
  source              = "./modules/security-groups"
  identifier          = var.identifier
  vpc_id              = module.vpc.vpc_id
  security_group_name = var.public_security_group_name
  rules               = var.public_sg_rules
}

# application-sg
module "application_security_group" {
  source                   = "./modules/security-groups"
  identifier               = var.identifier
  vpc_id                   = module.vpc.vpc_id
  security_group_name      = var.application_security_group_name
  rules                    = var.application_sg_rules
  source_security_group_id = module.public_security_group.security_group_id
  depends_on               = [module.public_security_group]
}

# data-sg
module "data_security_group" {
  source                   = "./modules/security-groups"
  identifier               = var.identifier
  vpc_id                   = module.vpc.vpc_id
  security_group_name      = var.data_security_group_name
  rules                    = var.data_sg_rules
  source_security_group_id = module.application_security_group.security_group_id
  depends_on               = [module.application_security_group]
}


# public ec2 
module "public_instance" {
  source                      = "./modules/instance"
  identifier                  = var.identifier
  name_instance               = var.name_instance_public
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  user_data                   = file("./user_data_configs/public_ec2_user_data.sh")
  subnet_id                   = module.vpc.public_subnets_ids[0]
  vpc_security_group_ids      = [module.public_security_group.security_group_id]
  associate_public_ip_address = var.associate_public_ip_address_public
  depends_on                  = [module.public_security_group, module.vpc]
}

# application ec2
module "application_instance" {
  source                      = "./modules/instance"
  identifier                  = var.identifier
  name_instance               = var.name_instance_application
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  user_data                   = file("./user_data_configs/application_ec2_user_data.sh")
  subnet_id                   = module.vpc.application_subnets_ids[0]
  vpc_security_group_ids      = [module.application_security_group.security_group_id]
  associate_public_ip_address = var.associate_public_ip_address_application
  depends_on                  = [module.application_security_group, module.vpc]
}

# data ec2
module "data_instance" {
  source                      = "./modules/instance"
  identifier                  = var.identifier
  name_instance               = var.name_instance_data
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  user_data                   = file("./user_data_configs/data_ec2_user_data.sh")
  subnet_id                   = module.vpc.data_subnets_ids[0]
  vpc_security_group_ids      = [module.data_security_group.security_group_id]
  associate_public_ip_address = var.associate_public_ip_address_data
  depends_on                  = [module.data_security_group, module.vpc]
}

module "Load_balancer" {
  source               = "./modules/Load_balancer"
  identifier           = var.identifier
  vpc_id               = module.vpc.vpc_id
  load_balancer_name   = var.alb_name
  load_balancer_type   = var.alb_load_balancer_type
  internal             = var.alb_internal
  subnets              = module.vpc.public_subnets_ids
  security_groups      = [module.public_security_group.security_group_id]
  target_group_name    = var.alb_target_group_name
  target_type          = var.alb_target_type
  port                 = var.alb_target_port
  protocol             = var.alb_target_protocol
  health_check_config  = var.alb_target_health_check_config
  listener_port        = var.alb_listener_port
  listener_protocol    = var.alb_listener_protocol
  target_instance_id   = module.application_instance.instance_id
  target_instance_port = var.target_instance_port
  depends_on           = [module.application_security_group, module.vpc] 
  
}