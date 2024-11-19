identifier="Todo-App"

vpc_cidr_block="10.0.0.0/16"
vpc_name="vpc"

public_subnets_cidr_block=["10.0.1.0/24","10.0.2.0/24"]
public_subnets_name=["public-subnet-1","public-subnet-2"]

application_subnets_cidr_block=["10.0.3.0/24","10.0.4.0/24"]
application_subnets_name=["application_subnet-1","application-subnet-2"]

data_subnets_cidr_block=["10.0.5.0/24","10.0.6.0/24"]
data_subnets_name=["data_subnet-1","data-subnet-2"]

IGW_name="igw"
cidr_route_igw="0.0.0.0/0"

public_RT_name="public_rt"
application_RT_name="application_rt"
data_RT_name="data_rt"
