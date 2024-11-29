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

variable "data_security_group_name" {
  type = string
}

variable "data_sg_rules" {
  type = list(object({
    type                     = string
    cidr_blocks              = optional(list(string))
    from_port                = number
    protocol                 = string
    to_port                  = number
    source_security_group_id = optional(string)
  }))
}

# names of instances 
variable "name_instance_public" {
  type = string
}
variable "name_instance_application" {
  type = string
}
variable "name_instance_data" {
  type = string
}

# same variables for all instance
variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}


#assosiate public
variable "associate_public_ip_address_public" {
  type = bool
}

variable "associate_public_ip_address_application" {
  type = bool
}

variable "associate_public_ip_address_data" {
  type = bool
}

# variable "user_data" {
#   type = string
# }


variable "alb_name" {
  type = string
}

variable "alb_load_balancer_type" {
  type    = string
  default = "application"
}

variable "alb_internal" {
  type    = bool
  default = false
}

variable "alb_target_group_name" {
  type = string
}

variable "alb_target_type" {
  type    = string
  default = "alb"
}

variable "alb_target_port" {
  type = number
}

variable "alb_target_protocol" {
  type = string
  #   default     = "HTTP"  
}

variable "alb_health_check_path" {
  type = string
  #   default     = "/health"  
}

variable "alb_listener_port" {
  type = number
  #   default     = 80  
}

variable "alb_listener_protocol" {
  type = string
  #   default     = "HTTP"  
}
