# application identifier
variable "identifier" {
    description = "value for identifier"
    type = string
}

# variable for vpc_id 
variable "vpc_id" {
  description = "getting vpc id"
  type        = string
}

# variable for multiple security groups creation 
# in this list of object for names and multiple ingress rules for each 
# variable "security_groups" {
#   description = "using list of objects "
  # type = list(object({
  #   name          = string
  #   ingress_rules = list(object({
  #     cidr_block    = string
  #     from_port     = number
  #     to_port       = number
  #     # protocol      = string
  #   }))
  # }))
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