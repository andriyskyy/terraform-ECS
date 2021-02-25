resource "aws_ecs_service" "worker" {
  name            = "worker"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 1
  load_balancer {
    target_group_arn = aws_lb_target_group.target_group.arn # Referencing our target group
    container_name   = aws_ecs_task_definition.task_definition.family
    container_port   = 5000 # Specifying the container port
  }
  /*network_configuration {
    subnets          = [aws_subnet.pub_subnet_a.id, aws_subnet.pub_subnet_b.id]
    assign_public_ip = true # Providing our containers with public IPs
    security_groups  = [ aws_security_group.service_security_group.id ] # Setting the security group
  }*/
  #depends_on = [ aws_alb.ecs_load_balancer ]
}
resource "aws_security_group" "service_security_group" {
    vpc_id        = aws_vpc.vpc.id
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    #security_groups = aws_security_group.load_balancer_security_group.id
    security_groups = [ aws_security_group.load_balancer_security_group.id ]

    # Only allowing traffic in from the load balancer security group
  }
   

  egress {
    from_port   = 0 # Allowing any incoming port
    to_port     = 0 # Allowing any outgoing port
    protocol    = "-1" # Allowing any outgoing protocol 
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }
}