resource "aws_launch_configuration" "ecs_launch_config" {
    image_id             = "ami-00129b193dc81bc31" #"ami-047a51fa27710816e"
    iam_instance_profile = aws_iam_instance_profile.ecs_agent.name
    security_groups      = [ aws_security_group.ecs_sg.id ]
    user_data            = file("~/Desktop/AWS_Task/terraform-ECS/startup.sh")
    instance_type        = "t2.small"
    associate_public_ip_address = true
    key_name          = "ecs_test" 
}
resource "aws_autoscaling_group" "ecs_asg" {
    name = "asg"
    vpc_zone_identifier = [ aws_subnet.pub_subnet_a.id, aws_subnet.pub_subnet_b.id ]
    launch_configuration = aws_launch_configuration.ecs_launch_config.name
    desired_capacity = 2
    min_size         = 1
    max_size         = 10
    health_check_grace_period = 300
    health_check_type = "EC2" 
}