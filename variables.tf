# application identifier
variable "identifier" {
  description = "value for identifier"
  type        = string
}

# vpc cidr
variable "vpc_cidr_block" {
  description = "value for the vpc_cidr_block"
  type        = string
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

# nat check variable
variable "enable_nat"{
    type = bool
    default = false
}


# variable for multiple security groups creation 
# in this list of object for names and multiple ingress rules for each 
# variable "security_groups" {
#   description = "using list of objects"
#   type = list(object({
#     name          = string
#     ingress_rules = list(object({
#       cidr_block    = string
#       from_port     = number
#       to_port       = number
#       protocol      = string
#     }))
#   }))
# }


variable "security_groups" {
  description = "using list of maps"
  type = map(object({
    ingress_rules = list(object({
      cidr_block    = string
      from_port     = number
      to_port       = number
      protocol      = string
    }))
  }))
}