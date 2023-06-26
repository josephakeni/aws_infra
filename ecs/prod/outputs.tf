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

