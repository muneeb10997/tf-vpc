identifier="Todo-App"

vpc_cidr_block="10.0.0.0/16"

public_subnets_cidr_block=["10.0.1.0/24","10.0.2.0/24"]

application_subnets_cidr_block=["10.0.10.0/24","10.0.3.0/24"]

data_subnets_cidr_block=["10.0.11.0/24","10.0.12.0/24"]

# enable_nat = "true"

# security groups variables
first_security_group_name = "public-sg"

first_sg_ingress_rules = [
  {
    cidr_blocks              = ["0.0.0.0/0"]
    from_port                = 22
    protocol                 = "tcp"
    to_port                  = 22
  },
  {
    cidr_blocks              = ["0.0.0.0/0"]
    from_port                = 80
    protocol                 = "tcp"
    to_port                  = 80
  }
]

first_sg_egress_rules = [
  {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
]

second_security_group_name = "application-sg"

second_sg_ingress_rules = [
  {
    cidr_blocks              = ["0.0.0.0/0"]
    from_port                = 22
    protocol                 = "tcp"
    to_port                  = 22
  },
  {
    # cidr_blocks              = [ ]
    from_port                = 5000
    protocol                 = "tcp"
    to_port                  = 5000
    source_security_group_id = ""
  }
]

second_sg_egress_rules = [
  {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
]
# # nginx server instance
# ami                         = "ami-0866a3c8686eaeeba"  
# instance_type               = "t2.micro"
# key_name                    = "public-key"
# associate_public_ip_address = true
# name = "nginx-server"