resource "aws_ecs_task_definition" "task_definition" {
    family                  = "worker"
    container_definitions   =  file("~/Desktop/AWS_Task/terraform-ECS/task_definition.json.tpl")
    task_role_arn           = "arn:aws:iam::837602901840:role/ecsTaskExecutionRole"
    execution_role_arn      = "arn:aws:iam::837602901840:role/ecsTaskExecutionRole"
    network_mode            = "bridge"
    cpu                     = "1024"
    memory                  = "1024"
    requires_compatibilities = [ "EC2" ]



  
}