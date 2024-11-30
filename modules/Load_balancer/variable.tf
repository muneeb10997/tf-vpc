variable "identifier" {
  type = string
}

variable "load_balancer_name" {
  type = string
}

variable "load_balancer_type" {
  type = string
  #   default     = "application"  
}

variable "internal" {
  type = bool
  #   default     = false  # 
}

variable "subnets" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "target_group_name" {
  type = string
}

variable "target_type" {
  type = string
  #   default     = "instance" 
}

variable "port" {
  type = number
}

variable "protocol" {
  type = string
  #   default     = "HTTP"  
}

variable "vpc_id" {
  type = string
}

variable "health_check_path" {
  type = string
  #   default     = "/health"  
}

variable "listener_port" {
  type = number
  #   default     = 80 
}

variable "listener_protocol" {
  type = string
  #   default     = "HTTP" 
}

variable "target_instance_id" {
  type = string
}

variable "target_instance_port" {
  type = number
}