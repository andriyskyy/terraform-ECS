resource "aws_lb_target_group" "target_group" {
  name        = "target-group"
  port        = 80
  protocol    = "HTTP"
  #target_type = "ip"
  vpc_id      = aws_vpc.vpc.id # Referencing the default VPC
  health_check {
    matcher = "200,301,302"
    path = "/"
  }
  depends_on = [ aws_alb.ecs_load_balancer ]

}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.ecs_load_balancer.arn # Referencing our load balancer
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn # Referencing our tagrte group
}
  }