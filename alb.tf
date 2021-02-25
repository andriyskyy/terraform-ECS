resource "aws_alb" "ecs_load_balancer" {
    name                = "ecs-load-balancer"
    load_balancer_type  = "application"
    security_groups     = [ aws_security_group.load_balancer_security_group.id ]
    subnets             = [ aws_subnet.pub_subnet_a.id, aws_subnet.pub_subnet_b.id ]

}

/*resource "aws_alb_target_group" "ecs-target-group" {
    name                = "ecs-target-group"
    port                = "80"
    protocol            = "HTTP"
    vpc_id              = aws_vpc.vpc.id

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "30"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }

}

/*
resource "aws_alb_listener" "alb-listener" {
    load_balancer_arn = aws_alb.ecs_load_balancer.arn
    port              = "80"
    protocol          = "HTTP"

    default_action {
        target_group_arn = aws_alb_target_group.ecs-target-group.arn
        type             = "forward"
    }
}
*/