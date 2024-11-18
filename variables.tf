variable "identifier" {
  description = "value for identifier"
  type        = string
}

# vpc variables
variable "vpc_cidr_block" {
  description = "value for the vpc_cidr_block"
  type        = string
}

variable "vpc_name" {
  description = "value for the vpc_name"
  type        = string
}

# # internet gateway variables
# variable "IGW_name" {
#     description = "value for the internet_gateway name"
#     type = string
# }

# variable "cidr_route_igw" {
#     description = "value for the cidr_route_igw"
#     type = string
# }


# subnet variables
variable "subnets_cidr_block" {
  description = "list for the  cidr_block"
  type        = list(string)
  default     = []
}

variable "subnets_name" {
  description = "list for subnets_name"
  type        = list(string)
  default     = []

}

# variable "public_subnet_2_cidr_block" {
#     description = "value for the public_subnet_1 cidr_block"
#     type = string
# }

# variable "public_subnet_2_name" {
#     description = "value for the public-subnet-1 name"
#     type = string
# }

# # application subnet variables
# variable "application_subnet_1_cidr_block" {
#     description = "value for the application_subnet_1 cidr_block"
#     type = string
# }

# variable "application_subnet_1_name" {
#     description = "value for the application-subnet-1 name"
#     type = string
# }

# variable "application_subnet_2_cidr_block" {
#     description = "value for the application_subnet_1 cidr_block"
#     type = string
# }

# variable "application_subnet_2_name" {
#     description = "value for the application-subnet-1 name"
#     type = string
# }

# # data subnet variables
# variable "data_subnet_1_cidr_block" {
#     description = "value for the data_subnet_1 cidr_block"
#     type = string
# }

# variable "data_subnet_1_name" {
#     description = "value for the data-subnet-1 name"
#     type = string
# }

# variable "data_subnet_2_cidr_block" {
#     description = "value for the data_subnet_1 cidr_block"
#     type = string
# }

# variable "data_subnet_2_name" {
#     description = "value for the data-subnet-1 name"
#     type = string
# }

# public route-table variables
# variable "public_RT_name" {
#     description = "value for the public_RT name"
#     type = string
# }

# # application route-table variables
# variable "applicaiton_RT_name" {
#     description = "value for the data_RT name"
#     type = string
# }

# # application route-table variables
# variable "data_RT_name" {
#     description = "value for the data_RT name"
#     type = string
# }