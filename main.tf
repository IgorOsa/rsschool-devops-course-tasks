module "iam" {
  source         = "./modules/iam"
  tags           = var.tags
  aws_account_id = var.aws_account_id
}

module "vpc" {
  source = "./modules/vpc"
  tags   = var.tags
}

# This module for saving TF states should be removed after all
# module "tfstates" {
#   source = "./modules/tf-states"
#   tags   = var.tags
# }

