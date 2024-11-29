resource "aws_lb" "Application_lb" {
  name               = "${var.identifier}-${var.load_balancer_name}-${terraform.workspace}"
  load_balancer_type = var.load_balancer_type
  internal           = var.internal
  security_groups    = var.security_groups
  subnets            = var.subnets
}

resource "aws_lb_target_group" "backend-target" {
  name        = "${var.identifier}-${var.target_group_name}-${terraform.workspace}"
  target_type = var.target_type #alb
  port        = var.port
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  health_check {
    path                = var.health_check_path
    interval            = 60
    timeout             = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "frontend_listener" {
  load_balancer_arn = aws_lb.Application_lb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend-target.arn
  }
}
