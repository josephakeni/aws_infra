module "roles" {
  source = "../modules/roles"
}

module "ecs-lbsg" {
  source        = "../modules/securityGroups"
  aws_vpc_main  = data.terraform_remote_state.network.outputs.main_vpc_id
  name          = "ecs-lb-sg"
  description   = "Allow traffic to ECS from instances"
  ingress_rules = var.ingress_rules
}

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
  source               = "../modules/ecs-ec2"
  security_groups      = [module.ecs-lbsg.sg_id]
  subnets              = [data.terraform_remote_state.network.outputs.public_subnets[0], data.terraform_remote_state.network.outputs.public_subnets[1]]
  aws_vpc_main         = data.terraform_remote_state.network.outputs.main_vpc_id
  container_name       = "zaizi_app"
  ecs_cluster_name     = "zaizi-ec2"
  launch_type          = "EC2"
  execution_role_arn   = module.roles.ecs_task_execution_role
  network_mode         = "bridge"
  iam_instance_profile = "TundeSSMRole"
  instance_type        = "t2.micro"
  key_name             = "cloud1a"
  app_image            = "jakeni/zaizi_app:v2"
  app_port             = "3000"
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
}
