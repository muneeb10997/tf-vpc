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

# variables for security group
variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}
variable "rules" {
  type        = list(object({
    type = string
    cidr_blocks              = optional(list(string))
    source_security_group_id = string
    from_port                = number
    protocol                 = string
    to_port                  = number
  }))
}
# variable for storing id form module 
variable "source_security_group_id" {
  description = "The ID of the security group to allow traffic from"
  type        = string
  default     = ""
}