identifier="Todo-App"

vpc_cidr_block="10.0.0.0/16"

public_subnets_cidr_block=["10.0.1.0/24","10.0.2.0/24"]

application_subnets_cidr_block=["10.0.10.0/24","10.0.3.0/24"]

data_subnets_cidr_block=["10.0.11.0/24","10.0.12.0/24"]

# enable_nat = "true"


# public security groups variables using list of objects
# security_groups = [
#   {
#     name          = "public_sg"
#     ingress_rules = [
#       {
#         cidr_block = "0.0.0.0/0"
#         from_port  = 80
#         to_port    = 80
#         protocol   = "tcp"
#       },
#       {
#         cidr_block = "0.0.0.0/0"
#         from_port  = 443
#         to_port    = 443
#         protocol   = "tcp"
#       }
#     ]
#   },
#   {
#     name          = "application_sg"
#     ingress_rules = [
#       {
#         cidr_block = "10.0.0.0/16"
#         from_port  = 22
#         to_port    = 22
#         protocol   = "tcp"
#       }
#     ]
#   },
#   {
#     name          = "data_sg"
#     ingress_rules = [
#       {
#         cidr_block = "192.168.1.0/24"
#         from_port  = 3306
#         to_port    = 3306
#         protocol   = "tcp"
#       }
#     ]
#   }
# ]


# using map of object
security_groups = {
  "public_sg" = {
    ingress_rules = [
      {
        cidr_block = "0.0.0.0/0"
        from_port  = 80
        to_port    = 80
        protocol   = "tcp"
      },
      {
        cidr_block = "0.0.0.0/0"
        from_port  = 443
        to_port    = 443
        protocol   = "tcp"
      }
    ]
  },
  "application_sg" = {
    ingress_rules = [
      {
        cidr_block = "0.0.0.0/0"
        from_port  = 22
        to_port    = 22
        protocol   = "tcp"
      }
    ]
  }

  "data_sg" = {
    ingress_rules = [
      {
        cidr_block = "0.0.0.0/0"
        from_port  = 22
        to_port    = 22
        protocol   = "tcp"
      }
    ]
  }
}

