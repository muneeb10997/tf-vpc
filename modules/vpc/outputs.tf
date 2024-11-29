output "identifier" {
  description = "identifier name"
  value       = var.identifier
}

output "vpc_id" {
  description = "The VPC ID"
  value       = aws_vpc.vpc.id
}

output "public_subnets_ids" {
  description = "The public_subnets IDs"
  value       = aws_subnet.public_subnets[*].id
}

output "application_subnets_ids" {
  description = "The application_subnets IDs"
  value       = aws_subnet.application_subnets[*].id
}

output "data_subnets_ids" {
  description = "The data_subnets IDs"
  value       = aws_subnet.data_subnets[*].id
}