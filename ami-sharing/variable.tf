variable "profile" {
  description = "AWS Profile"
  default     = "default"
}
variable "region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable "account_ids" {
  description = "List of Account IDs"
  type        = list(string)
  default     = ["329097154178"] # List of AWS accounts to share the ami_id with
}