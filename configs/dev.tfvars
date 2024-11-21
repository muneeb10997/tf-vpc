identifier="Todo-App"

vpc_cidr_block="10.0.0.0/16"

public_subnets_cidr_block=["10.0.1.0/24","10.0.2.0/24"]

application_subnets_cidr_block=["10.0.10.0/24","10.0.3.0/24"]

data_subnets_cidr_block=["10.0.11.0/24","10.0.12.0/24"]

# enable_nat = "true"


# public security groups variables
ingress_cidr_blocks_public=["0.0.0.0/0","0.0.0.0/0","0.0.0.0/0"]
ingress_from_ports_public=["22","80","443"]
ingress_to_ports_public=["22","80","443"]
ingress_protocols_public=["tcp","tcp","tcp"]

#application security groups variables
ingress_cidr_blocks_application=["0.0.0.0/0","0.0.0.0/0","0.0.0.0/0"]
ingress_from_ports_application=["22","80","443"]
ingress_to_ports_application=["22","80","443"]
ingress_protocols_application=["tcp","tcp","tcp"]

#application security groups variables
ingress_cidr_blocks_data=["0.0.0.0/0","0.0.0.0/0","0.0.0.0/0"]
ingress_from_ports_data=["22","80","443"]
ingress_to_ports_data=["22","80","443"]
ingress_protocols_data=["tcp","tcp","tcp"]
