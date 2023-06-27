# variable "profile" {
#   default = "devop03"
# }

variable "region" {
  default = "eu-west-1"
}

variable "tenancy" {
  type    = string
  default = "default"
  # description = "description"
}

variable "main_vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
  # description = "description"
}

variable "environment" {
  default = ""
}

variable "name" {
  default = "jotonia"
}

variable "public_subnets" {
  type    = list(any)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.16.0/20", "10.0.32.0/20"]
}

variable "availability_zones" {
  type    = list(any)
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

# variable "app_port" {}

variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))
  default = [
    # {
    #   from_port   = 22
    #   to_port     = 22
    #   protocol    = "tcp"
    #   cidr_block  = "0.0.0.0/0"
    #   description = "SSH Port"
    # },
    # {
    #   from_port   = 80
    #   to_port     = 80
    #   protocol    = "tcp"
    #   cidr_block  = "0.0.0.0/0"
    #   description = "test"
    # },
    # {
    #   from_port   = 8080
    #   to_port     = 8080
    #   protocol    = "tcp"
    #   cidr_block  = "0.0.0.0/0"
    #   description = "test"
    # },
    # {
    #   from_port   = 3000
    #   to_port     = 3000
    #   protocol    = "tcp"
    #   cidr_block  = "0.0.0.0/0"
    #   description = "test"
    # },
    # {
    #   from_port   = -1
    #   to_port     = -1
    #   protocol    = "icmp"
    #   cidr_block  = "0.0.0.0/0"
    #   description = "test"
    # },
  ]
}
