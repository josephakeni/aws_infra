provider "aws" {
  region = var.region
  #profile = "${var.profile}"
}

module "r53" {
  source = "git::git@github.com:josephakeni/aws_modules.git//r53"
}

module "roles" {
  source = "git::git@github.com:josephakeni/aws_modules.git//roles"
}
module "ecs-lbsg" {
  source        = "git::git@github.com:josephakeni/aws_modules.git//securityGroups"
  aws_vpc_main  = data.terraform_remote_state.network.outputs.main_vpc_id
  name          = "ecs-lb-sg"
  description   = "Allow traffic to ECS from instances"
  ingress_rules = var.ingress_rules
}

module "main_vpc" {
  source              = "git::git@github.com:josephakeni/aws_modules.git//vpc"
  main_vpc_cidr_block = var.main_vpc_cidr_block
  tenancy             = var.tenancy
  private_subnets     = var.private_subnets
  name                = var.name
  public_subnets      = var.public_subnets
  environment         = var.environment
  availability_zones  = var.availability_zones
  db_subnets = var.db_subnets
}

# module "alb" {
#  source       = "../modules/alb"
#  aws_vpc_main = data.terraform_remote_state.network.outputs.main_vpc_id
#  subnet_id    = [data.terraform_remote_state.network.outputs.public_subnets[0], data.terraform_remote_state.network.outputs.public_subnets[1]]
#  main_sg_id   = data.terraform_remote_state.network.outputs.main_sg_id
#  name         = "prod-alb"
#  app_port = var.app_port
# }