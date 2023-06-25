# output "fargate_alb_hostname" {
#   value = module.ecs-fargate.alb_hostname
#   #  sensitive   = true
#   description = "fargate alb hostname"
#   #  depends_on  = []
# }

output "ecs-ec2_alb_hostname" {
  value = module.ecs-ec2.alb_hostname
  #  sensitive   = true
  description = "ecs-ec2 alb hostname"
  #  depends_on  = []
}

output "ecs_task_execution_role" {
  value = module.roles.ecs_task_execution_role
  #  sensitive   = true
  description = "ecs_task_execution_role"
  #  depends_on  = []
}

output "ecs_container_service_autoscale_role" {
  value       = module.roles.ecs_container_service_autoscale_role
  description = "ecs_container_service_autoscale_role"
}


output "ecs-lbsg" {
  value = module.ecs-lbsg.sg_id
}
