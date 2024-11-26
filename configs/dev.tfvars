identifier="Todo-App"

vpc_cidr_block="10.0.0.0/16"

public_subnets_cidr_block=["10.0.1.0/24","10.0.2.0/24"]

application_subnets_cidr_block=["10.0.10.0/24","10.0.3.0/24"]

data_subnets_cidr_block=["10.0.11.0/24","10.0.12.0/24"]

# enable_nat = "true"

# security groups variables
security_groups = {
  public_sg = {
    ingress_rules = [
      {
        cidr_ipv4   = "0.0.0.0/0"
        from_port   = 80
        ip_protocol = "tcp"
        to_port     = 80
      },
      {
        cidr_ipv4   = "0.0.0.0/0"
        from_port   = 443
        ip_protocol = "tcp"
        to_port     = 443
      },
      {
        cidr_ipv4   = "0.0.0.0/0"
        from_port   = 22
        ip_protocol = "tcp"
        to_port     = 22
      },
    ]
    egress_rules = [
      {
        cidr_ipv4   = "0.0.0.0/0"
        from_port   = 0
        ip_protocol = "-1" # All protocols
        to_port     = 0
      }
    ]
  },
  application_sg = {
    ingress_rules = [
      {
        cidr_ipv4   = "0.0.0.0/0"
        from_port   = 80
        ip_protocol = "tcp"
        to_port     = 80
      },
      {
        cidr_ipv4   = "0.0.0.0/0"
        from_port   = 443
        ip_protocol = "tcp"
        to_port     = 443
      },
      {
        cidr_ipv4   = "0.0.0.0/0"
        from_port   = 22
        ip_protocol = "tcp"
        to_port     = 22
      },
      {
        # cidr_ipv4   = "0.0.0.0/0"
        source_sg_id = "sg-012dedc2f0c42223a"
        from_port   = 5000
        ip_protocol = "tcp"
        to_port     = 5000
      }
    ]
    egress_rules = [
      {
        cidr_ipv4   = "0.0.0.0/0"
        from_port   = 0
        ip_protocol = "-1" # All protocols
        to_port     = 0
      }
    ]
  }
}
