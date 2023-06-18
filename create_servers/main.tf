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

module "AppServer" {
  source         = "../modules/ec2"
  instance_count = var.app_server_count
  ami_id         = data.aws_ami.amazon-linux.id
  instance_type  = var.instance_type
  iam_role       = var.iam_role
  subnet_id      = [data.terraform_remote_state.network.outputs.public_subnets[1]]
  main_sg_id       = data.terraform_remote_state.network.outputs.main_sg_id
  bootstrap_script = [var.installApp["none"]]
  name             = var.app_server
  environment      = var.environment
  role             = var.role
}