variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "description"
}
variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 3000
}
variable "desired_capacity" {}
variable "max_size" {}
variable "min_size" {}
variable "container_name" {}
variable "network_mode" {}
variable "iam_instance_profile" {}
variable "instance_type" {}
variable "key_name" {}
variable "app_image" {}
variable "ecs_cluster_name" {}
variable "launch_type" {}
