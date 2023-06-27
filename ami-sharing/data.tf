data "aws_caller_identity" "current" {}

data "aws_ami" "amzLinux" {
  most_recent = true
  owners      = [data.aws_caller_identity.current.account_id]
  filter {
    name   = "name"
    values = ["task2-packer-amazon-linux-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}