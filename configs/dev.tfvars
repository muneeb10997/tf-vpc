identifier = "Todo-App"

vpc_cidr_block = "10.0.0.0/16"

public_subnets_cidr_block = ["10.0.1.0/24", "10.0.2.0/24"]

application_subnets_cidr_block = ["10.0.10.0/24", "10.0.3.0/24"]

data_subnets_cidr_block = ["10.0.11.0/24", "10.0.12.0/24"]

enable_nat = "true"

# public sg variables
public_security_group_name = "public-sg"
public_sg_rules = [
  {
    type        = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  },
  {
    type        = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  },
  {
    type        = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
  },
  {
    type        = "egress"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
]

# application sg variables
application_security_group_name = "application-sg"
application_sg_rules = [
  {
    type        = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  },
  {
    type = "ingress"
    # cidr_blocks              = [""]
    from_port                = 5000
    protocol                 = "tcp"
    to_port                  = 5000
    source_security_group_id = ""
  },
  {
    type        = "egress"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
]

# data sg variables
data_security_group_name = "data-sg"
data_sg_rules = [
  {
    type        = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  },
  {
    type = "ingress"
    # cidr_blocks              = [""]
    from_port                = 3306
    protocol                 = "tcp"
    to_port                  = 3306
    source_security_group_id = ""
  },
  {
    type        = "egress"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
]




# instance creation in a vpc public subnet along with attaching security group
ami           = "ami-0866a3c8686eaeeba"
instance_type = "t2.micro"
key_name      = "public-key"
# user_data =<<-EOF
# #!/bin/bash
# apt update -y
# apt install nginx -y
# systemctl start nginx
# systemctl enable nginx
# EOF

# public ec2 variables
name_instance_public               = "public-ec2"
associate_public_ip_address_public = true

# application ec2 variables
name_instance_application               = "application-ec2"
associate_public_ip_address_application = false

# data-ec2 variables 
name_instance_data               = "data-ec2"
associate_public_ip_address_data = false


# Load balancer variables
alb_name               = "flask-ALB"
alb_load_balancer_type = "application"
alb_internal           = false
alb_target_group_name  = "backend-target"
alb_target_type        = "instance"
alb_target_port        = 5000
alb_target_protocol    = "HTTP"
alb_health_check_path  = "/health"
alb_listener_port      = 80
alb_listener_protocol  = "HTTP"