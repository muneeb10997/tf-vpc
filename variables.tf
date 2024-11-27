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

# variable for security groups
variable "first_security_group_name" {
  type        = string
}

variable "first_sg_ingress_rules" {

  type        = list(object({
    cidr_blocks              = optional(list(string))
    from_port                = number
    protocol                 = string
    to_port                  = number
    source_security_group_id = optional(string)
  }))
}

variable "first_sg_egress_rules" {
  type        = list(object({
    cidr_blocks = list(string)
    from_port   = number
    protocol    = string
    to_port     = number
  }))
}


variable "second_security_group_name" {
  type        = string
}

variable "second_sg_ingress_rules" {

  type        = list(object({
    cidr_blocks              = optional(list(string))
    from_port                = number
    protocol                 = string
    to_port                  = number
    source_security_group_id = optional(string)
  }))
}

variable "second_sg_egress_rules" {
  type        = list(object({
    cidr_blocks = list(string)
    from_port   = number
    protocol    = string
    to_port     = number
  }))
}

variable "source_security_group_id" {
  description = "The ID of the first security group to allow traffic from"
  type        = string
  default     = ""
}
# instance variables
# variable "ami" {
#     type        = string  
# }
# variable "instance_type" {
#   type        = string
# }

# variable "subnet_id" {
#   type        = string
# }

# variable "security_groups" {
#   type        = list(string)
# }

# variable "associate_public_ip_address" {
#   type        = bool
# }

# variable "name" {
#   type        = string
# }

# variable "key_name" {
#   type        = string
# }