# application identifier
variable "identifier" {
    description = "value for identifier"
    type = string
}
variable "vpc_id" {
  description = "getting vpc id"
  type        = string
}

variable "cidr_ipv4_http" {
  description = "inbound cidr for http"
  type = string
}

variable "cidr_ipv4_https" {
  description = "inbound cidr for https"
  type = string
}

variable "cidr_ipv4_ssh" {
  description = "inbound cidr for ssh"
  type = string
}