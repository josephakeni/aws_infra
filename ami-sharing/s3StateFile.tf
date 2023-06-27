############################################
#           S3 BACKEND                     #
############################################
terraform {
  backend "s3" {
    bucket = "cloudpart1buk"
    key    = "ami-sharing/terraform.tfstate"
    region = "eu-west-1"
  }
}
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}