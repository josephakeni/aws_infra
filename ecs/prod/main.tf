



# module "ecs-fargate" {
#   source                               = "../modules/ecs-fargate"
#   aws_vpc_main                         = data.terraform_remote_state.network.outputs.main_vpc_id
#   subnets                              = [data.terraform_remote_state.network.outputs.public_subnets[0], data.terraform_remote_state.network.outputs.public_subnets[1]]
#   security_groups                      = [module.ecs-lbsg.sg_id]
#   ecs_cluster_name                     = "jotonia-fargate"
#   container_name                       = "jotonia"
#   network_mode                         = "awsvpc"
#   launch_type                          = "FARGATE"
#   execution_role_arn                   = module.roles.ecs_task_execution_role
#   ecs_container_service_autoscale_role = module.roles.ecs_container_service_autoscale_role
#   target_type                          = "ip"
#   app_image                            = "jakeni/jotonia-app:myapp1"
#   app_port                             = "3000"
# }

module "ecs-ec2" {
  source               = "../../modules/ecs-ec2"
  security_groups      = [data.terraform_remote_state.network.outputs.ecs-lbsg]
  subnets              = [data.terraform_remote_state.network.outputs.public_subnets[0], data.terraform_remote_state.network.outputs.public_subnets[1]]
  aws_vpc_main         = data.terraform_remote_state.network.outputs.main_vpc_id
  container_name       = var.container_name
  ecs_cluster_name     = var.ecs_cluster_name
  launch_type          = var.launch_type
  execution_role_arn   = data.terraform_remote_state.network.outputs.ecs_task_execution_role
  network_mode         = var.network_mode
  iam_instance_profile = var.iam_instance_profile
  instance_type        = var.instance_type
  key_name             = var.key_name
  app_image            = "jakeni/zaizi_app:v1"
  app_port             = var.app_port
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
}
