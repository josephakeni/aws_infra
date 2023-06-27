variable "admin_users" {
  type    = list(any)
  default = ["neo", "trinity", "mope"]
}
variable "developers" {
  type    = list(any)
  default = ["neo45", "trini", "nife"]
}

variable "group_name" {
  type        = list(any)
  default     = [""]
  description = "description"
}


# variable "developers" {
#   type        = string
#   default     = "developers"
#   description = "description"
# }

# variable "operations1" {
#   type        = string
#   default     = ""
#   description = "description"
# }

