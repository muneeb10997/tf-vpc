output "alb_dns_name" {
  description = "DNS of Load balancer"
  value       = aws_lb.Application_lb.dns_name
}