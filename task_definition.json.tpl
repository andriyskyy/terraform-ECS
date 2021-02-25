[
{
    "essential": true,
    "memory": null,
    "memoryReservation": 512,
    "workingDirectory": "/app",
    "name": "worker",
    "cpu": 0,
    "image": "public.ecr.aws/t3d1u3n8/flask:latest",
    "environment": [],
    "portMappings": [
    {
        "containerPort": 5000,
        "hostPort": 80,
        "protocol": "tcp"
    }
    ]
  }
]