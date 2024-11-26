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