resource "aws_lb" "Application_lb" {
  name               = "${var.identifier}-${var.load_balancer_name}-${terraform.workspace}"
  load_balancer_type = var.load_balancer_type
  internal           = var.internal
  security_groups    = var.security_groups
  subnets            = var.subnets
}
resource "aws_lb_listener" "frontend_listener" {
  load_balancer_arn = aws_lb.Application_lb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}

# target group and registration of targets 
resource "aws_lb_target_group" "target" {
  name        = "${var.identifier}-${var.target_group_name}-${terraform.workspace}"
  vpc_id      = var.vpc_id
  target_type = var.target_type #alb
  port        = var.port
  protocol    = var.protocol
  
  health_check {
  path                = var.health_check_config.path
  interval            = var.health_check_config.interval
  timeout             = var.health_check_config.timeout
  healthy_threshold   = var.health_check_config.healthy_threshold
  unhealthy_threshold = var.health_check_config.unhealthy_threshold
}

}

resource "aws_lb_target_group_attachment" "instance_attachment" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = var.target_instance_id
  port             = var.target_instance_port
}


