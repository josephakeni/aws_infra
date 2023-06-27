provider "aws" {
  region = var.region
  # profile = var.profile
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "cloudpart1buk"
    key    = "part1/terraform.tfstate"
    region = "${var.region}"
    # profile = "${var.profile}"
  }
}

# Use terraform to query latest generated AMI..
# amazon-linux
data "aws_ami" "amazon-linux" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Name"
    values = ["task2-packer-amazon-linux"]
  }

  most_recent = true
  owners      = ["self"]
}

# ubuntu
data "aws_ami" "ubuntu" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Name"
    values = ["task2-packer-ubuntu"]
  }

  most_recent = true
  owners      = ["self"]
}
