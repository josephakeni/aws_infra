
# module "zookeeper" {
#   source           = "../modules/ec2"
#   instance_count   = var.zookeeper_count
#   ami_id           = data.aws_ami.amazon-linux.id
#   instance_type    = var.instance_type
#   subnet_id        = [data.terraform_remote_state.network.outputs.public_subnet_c_id]
#   main_sg_id       = data.terraform_remote_state.network.outputs.zookeeper_sg_id
#   bootstrap_script = [var.installApp["baseline"]]
#   name             = "zookeeper"
#   environment      = var.environment
#   role             = var.role
# }

# module "ProdAppServer" {
#   source         = "../modules/ec2"
#   instance_count = var.prod_server_count
#   ami_id         = data.aws_ami.amazon-linux.id
#   instance_type  = var.instance_type
#   iam_role       = var.iam_role
#   subnet_id      = [data.terraform_remote_state.network.outputs.private_subnets[1]]

#   main_sg_id       = data.terraform_remote_state.network.outputs.main_sg_id
#   bootstrap_script = [var.installApp["none"]]
#   name             = var.prod_server
#   environment      = var.environment
#   role             = var.role
# }

module "ubuntu" {
  source           = "../modules/ec2"
  instance_count   = var.public_ubuntu_count
  ami_id           = data.aws_ami.ubuntu.id
  instance_type    = var.instance_type
  iam_role       = var.iam_role
  subnet_id        = [data.terraform_remote_state.network.outputs.public_subnets[0]]
  main_sg_id       = data.terraform_remote_state.network.outputs.main_sg_id
  bootstrap_script = [var.installApp["tools1"]]
  name             = var.ubuntuServer
  environment      = var.environment
  role             = var.toolServer

}
