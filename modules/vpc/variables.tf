variable "identifier" {
    description = "value for identifier"
    type = string
}
# vpc variables
variable "vpc_cidr_block" {
    description = "value for the vpc_cidr_block"
    type = string
}
variable "vpc_name" {
    description = "value for the vpc_name"
    type = string
}

# public_subnets variables
variable "public_subnets_cidr_block" {
    description = "list for public_subnets_cidr_block"
    type = list(string)
    default = []
}

# application_subnets variables
variable "application_subnets_cidr_block" {
    description = "list for application_subnets_cidr_block"
    type = list(string)
    default = []
}

# data_subnets variables
variable "data_subnets_cidr_block" {
    description = "list for data_subnets_cidr_block"
    type = list(string)
    default = []
}


# public route-table variables
variable "public_RT_name" {
    description = "value for the public_RT name"
    type = string
}
# application route-table variables
variable "application_RT_name" {
    description = "value for the data_RT name"
    type = string
}
# application route-table variables
variable "data_RT_name" {
    description = "value for the data_RT name"
    type = string
}