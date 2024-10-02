module "iam" {
  source         = "./modules/iam"
  tags           = var.tags
  aws_account_id = var.aws_account_id
}

module "tfstates" {
  source = "./modules/tf-states"
  tags   = var.tags
}
