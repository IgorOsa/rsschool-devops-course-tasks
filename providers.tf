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
