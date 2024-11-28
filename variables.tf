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
  type        = list(string)
  default     = []
}

# application_subnets variables
variable "application_subnets_cidr_block" {
  description = "list for application_subnets_cidr_block"
  type        = list(string)
  default     = []
}

# data_subnets variables
variable "data_subnets_cidr_block" {
  description = "list for data_subnets_cidr_block"
  type        = list(string)
  default     = []
}

# nat check variable
variable "enable_nat" {
  type    = bool
  default = false
}

# variables for public security group
variable "public_security_group_name" {
  type = string
}
variable "public_sg_rules" {
  type = list(object({
    type                     = string
    cidr_blocks              = optional(list(string))
    from_port                = number
    protocol                 = string
    to_port                  = number
    source_security_group_id = optional(string)
  }))
}

# variables for application security group
variable "application_security_group_name" {
  type = string
}

variable "application_sg_rules" {
  type = list(object({
    type                     = string
    cidr_blocks              = optional(list(string))
    from_port                = number
    protocol                 = string
    to_port                  = number
    source_security_group_id = optional(string)
  }))
}


variable "name_instance" {
  type = string
}
variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}

variable "associate_public_ip_address" {
  type = bool
}

variable "user_data" {
  type = string
}