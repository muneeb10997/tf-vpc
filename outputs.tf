
output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets_ids" {
  description = "The VPC ID"
  value       = module.vpc.public_subnets_ids
}

output "security_group_ids" {
  description = "The IDs of the created security groups"
  value = module.security_groups.security_group_ids
}