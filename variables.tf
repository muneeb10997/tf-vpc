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


# Define the variable for security groups
variable "security_groups" {
  type = map(object({
    ingress_rules = list(object({
      cidr_ipv4         = optional(string)
      from_port         = number
      ip_protocol       = string
      to_port           = number
      source_sg_id      = optional(string) 
    }))
    egress_rules = list(object({
      cidr_ipv4         = optional(string)
      from_port         = number
      ip_protocol       = string
      to_port           = number
      destination_sg_id = optional(string) 
    }))
  }))
}