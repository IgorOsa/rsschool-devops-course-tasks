terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    region  = "eu-central-1"
    bucket  = "rss-devops-tfstate"
    key     = "state/terraform.tfstate"
    encrypt = true
    # dynamodb_table = "rss-devops-tf-lockid"
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = ["d89e3bd43d5d909b47a18977aa9d5ce36cee184c"]

  tags = local.tags
}
