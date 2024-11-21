# application identifier
variable "identifier" {
    description = "value for identifier"
    type = string
}
variable "vpc_id" {
  description = "getting vpc id"
  type        = string
}


# public security group variables
variable "ingress_cidr_blocks_public" {
  description = "inbound cidr for http"
  type = list(string)
  default = [ ]
}

variable "ingress_from_ports_public" {
  description = "inbound cidr for http"
  type = list(string)
  default = [ ]
}

variable "ingress_to_ports_public" {
  description = "inbound cidr for http"
  type = list(string)
  default = [ ]
}

variable "ingress_protocols_public" {
  description = "inbound cidr for http"
  type = list(string)
  default = [ ]
}

# application security group variables
variable "ingress_cidr_blocks_application" {
  description = "inbound cidr for http"
  type = list(string)
  default = [ ]
}

variable "ingress_from_ports_application" {
  description = "inbound cidr for http"
  type = list(string)
  default = [ ]
}

variable "ingress_to_ports_application" {
  description = "inbound cidr for http"
  type = list(string)
  default = [ ]
}

variable "ingress_protocols_application" {
  description = "inbound cidr for http"
  type = list(string)
  default = [ ]
}


# data security group variabbles
variable "ingress_cidr_blocks_data" {
  description = "inbound cidr for http"
  type = list(string)
  default = [ ]
}

variable "ingress_from_ports_data" {
  description = "inbound cidr for http"
  type = list(string)
  default = [ ]
}

variable "ingress_to_ports_data" {
  description = "inbound cidr for http"
  type = list(string)
  default = [ ]
}

variable "ingress_protocols_data" {
  description = "inbound cidr for http"
  type = list(string)
  default = [ ]
}
