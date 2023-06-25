variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "description"
}
variable "ingress_rules" {}
variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 3000
}
variable "desired_capacity" {}
variable "max_size" {}
variable "min_size" {}