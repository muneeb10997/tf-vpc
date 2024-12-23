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
