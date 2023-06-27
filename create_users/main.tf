

module "iam" {
  source = "../modules/iam"
}

module "admin" {
  source     = "../modules/users"
  username   = var.admin_users
  group_name = [module.iam.group_developers_name, "operations1"]
}
module "developers" {
  source     = "../modules/users"
  username   = var.developers
  group_name = [module.iam.group_developers_name, ]
}