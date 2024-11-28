# application identifier
variable "identifier" {
  description = "value for identifier"
  type        = string
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

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "associate_public_ip_address" {
  type = bool
}

variable "user_data" {
  type = string
}