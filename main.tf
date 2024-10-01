
module "iam" {
  source         = "./modules/iam"
  tags           = var.tags
  aws_account_id = var.aws_account_id
}
