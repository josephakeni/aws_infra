[
  {
    "essential": true,
    "memory": 512,
    "name": "${container_name}",
    "cpu": 2,
    "image": "${app_image}",
    "environment": [],
    "portMappings": [
      {
        "containerPort": ${app_port},
        "hostPort": ${app_port}
      }
    ]
  }
]