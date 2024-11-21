# application identifier
variable "identifier" {
    description = "value for identifier"
    type = string
}

variable "public_subnets_ids" {
  description = "getting list for public_subnets_ids"
    type = list(string)
    default = [] 
  
}

variable "public_ec2_sg_id" {
  description = "public security group id"
  type        = string
}