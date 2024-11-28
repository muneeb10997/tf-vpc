identifier = "Todo-App"

vpc_cidr_block = "10.0.0.0/16"

public_subnets_cidr_block = ["10.0.1.0/24", "10.0.2.0/24"]

application_subnets_cidr_block = ["10.0.10.0/24", "10.0.3.0/24"]

data_subnets_cidr_block = ["10.0.11.0/24", "10.0.12.0/24"]

# enable_nat = "true"

# security groups variables
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


# instance creation in a vpc public subnet along with attaching security group
name_instance               = "nginx"
ami                         = "ami-0866a3c8686eaeeba"
instance_type               = "t2.micro"
key_name                    = "public-key"
associate_public_ip_address = true
# user_data =<<-EOF
# #!/bin/bash
# apt update -y
# apt install nginx -y
# systemctl start nginx
# systemctl enable nginx
# EOF
