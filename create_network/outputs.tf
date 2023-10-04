output "main_vpc_id" {
  value = module.main_vpc.main_vpc_id
}

output "private_subnets" {
  value = module.main_vpc.private_subnets
}

output "public_subnets" {
  value = module.main_vpc.public_subnets
}

output "internet_gateway_id" {
  value = module.main_vpc.internet_gateway_id
}

output "main_sg_id" {
  value = module.main_vpc.main_sg_id
}



# output "nat_eip_id" {
#   value = "${module.main_vpc.nat_eip_id}"
# }

# output "nat_gw_id" {
#   value = "${module.main_vpc.nat_gw_id}"
# }

output "public_route_table_id" {
  value = module.main_vpc.public_route_table_id
}

output "private_route_table_id" {
  value = module.main_vpc.private_route_table_id
}

output "main_public_ids" {
  value = module.main_vpc.main_public_ids
}

output "main_private_ids" {
  value = module.main_vpc.main_private_ids
}

# output "aws_lb_target_group_id" {
#   value = module.alb.aws_lb_target_group_id
# }

# output "aws_lb_listener_front_end" {
#   value = module.alb.aws_lb_listener_front_end
# }

# output "alb_hostname" {
#   value = module.alb.alb_hostname
# }
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

output "aws_route53_zone" {
  value = module.r53.aws_route53_zone
} 