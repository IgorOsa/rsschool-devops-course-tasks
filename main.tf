module "iam" {
  source         = "./modules/iam"
  tags           = var.tags
  aws_account_id = var.aws_account_id
}

module "vpc" {
  source                   = "./modules/vpc"
  tags                     = var.tags
  aws_account_id           = var.aws_account_id
  admin_access_cidr_blocks = var.admin_access_cidr_blocks
}

module "k8s_cluster" {
  source = "./modules/k8s_cluster"

  k8s_cluster_name         = "k8s_cluster"
  k8s_master_instance_type = "t2.micro"
  k8s_worker_instance_type = "t2.micro"
  vpc_id                   = module.vpc.vpc_id
  public_subnet_ids        = module.vpc.public_subnet_ids
  private_subnet_ids       = module.vpc.private_subnet_ids
  bastion_host_public_ip   = module.vpc.bastion_host_public_ip
  availability_zones       = var.availability_zones

  depends_on = [module.vpc]
}

# This module for saving TF states should be removed after all
# module "tfstates" {
#   source = "./modules/tf-states"
#   tags   = var.tags
# }

