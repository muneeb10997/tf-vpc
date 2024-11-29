
output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets_ids" {
  description = "The VPC ID"
  value       = module.vpc.public_subnets_ids
}
output "application_subnets_ids" {
  description = "The VPC ID"
  value       = module.vpc.application_subnets_ids
}
output "data_subnets_ids" {
  description = "The VPC ID"
  value       = module.vpc.data_subnets_ids
}



output "public_security_group_id" {
  description = "The IDs of the created security groups"
  value       = module.public_security_group.security_group_id
}

output "application_security_group_id" {
  description = "The IDs of the created security groups"
  value       = module.application_security_group.security_group_id
}

output "public_instance_public_ip" {
  value = module.public_instance.instance_public_ip
}

