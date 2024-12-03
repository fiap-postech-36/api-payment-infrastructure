resource "aws_alb" "alb" {
  name               = "ALB-${var.projectName}"
  internal           = false
  load_balancer_type = "application"
  subnets = [
    module.vpc.public_subnets[0], # Subnet na AZ us-east-1a
    module.vpc.public_subnets[1]  # Subnet na AZ us-east-1b
  ]
  security_groups = [aws_security_group.sg-rds.id]
  idle_timeout    = 60
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
