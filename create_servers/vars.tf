variable "region" {
  default = "eu-west-1"
}

variable "profile" {
  default = "default"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "iam_role" {
  type        = string
  default     = "TundeSSMRole"
  description = "SSM IAM Role"
}

variable "installApp" {
  type = map(string)
  default = {
    "tools1"          = "../scripts/install_tools1.sh"
    "baseline"        = "../scripts/install_baseline.sh"
    "baseline_tools"  = "../scripts/install_baseline_tools.sh"
    "nginx"           = "../scripts/install_nginx.sh"
    "apache"          = "../scripts/install_apache.sh"
    "monitoring"      = "../scripts/install_monitoring.sh"
    "ubuntu_baseline" = "../scripts/ubuntu_baseline.sh"
    "none"            = "../scripts/install_none.sh"
  }
}

variable "private_instance_count" {
  default = 1
}

variable "public_instance_count" {
  default = 1
}

variable "dev_server_count" {}
variable "app_server_count" {}
variable "jenkins_instance_count" {}
variable "environment" {}
variable "role" {}
variable "app_server" {}
variable "ubuntuServer" {}
variable "toolServer" {}