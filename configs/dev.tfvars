identifier="Todo-App"

vpc_cidr_block="10.0.0.0/16"

public_subnets_cidr_block=["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24","10.0.5.0/24","10.0.6.0/24","10.0.7.0/24","10.0.8.0/24","10.0.9.0/24"]

application_subnets_cidr_block=["10.0.10.0/24"]

data_subnets_cidr_block=["10.0.11.0/24","10.0.12.0/24"]

# enable_nat = "true"


# public instance security groups variables

cidr_ipv4_http  = "0.0.0.0/0"
cidr_ipv4_https = "0.0.0.0/0"
cidr_ipv4_ssh   = "0.0.0.0/0"


#ec2 variables for dev enviroment
# ami = "ami-0866a3c8686eaeeba"