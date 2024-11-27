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

# variable for security groups

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type        = list(object({
    cidr_blocks              = optional(list(string))
    source_security_group_id = optional(string)
    from_port                = number
    protocol                 = string
    to_port                  = number
  }))
}

variable "egress_rules" {
  description = "List of egress rules for the security group"
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

# variable "security_groups" {
#   type = map(object({
#     ingress_rules = list(object({
#       cidr_ipv4         = optional(string) 
#       from_port         = number
#       ip_protocol       = string
#       to_port           = number
#       source_sg_id      = optional(string) 
#     }))
#     egress_rules = list(object({
#       cidr_ipv4         = optional(string) 
#       from_port         = number
#       ip_protocol       = string
#       to_port           = number
#       destination_sg_id = optional(string)
#     }))
#   }))
# }