# rss-devops-aws

[![Check, Plan & Apply](https://github.com/IgorOsa/rsschool-devops-course-tasks/actions/workflows/workflow.yml/badge.svg)](https://github.com/IgorOsa/rsschool-devops-course-tasks/actions/workflows/workflow.yml)

## How to work with repository

### Prerequisites

   - Follow the instructions to install [AWS CLI 2](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
   - Follow the instructions to install [Terraform 1.6+](https://developer.hashicorp.com/terraform/install?product_intent=terraform).

Usinf non root AWS user, check/provide next policies:

    - AmazonEC2FullAccess
    - AmazonRoute53FullAccess
    - AmazonS3FullAccess
    - IAMFullAccess
    - AmazonVPCFullAccess
    - AmazonSQSFullAccess
    - AmazonEventBridgeFullAccess

Generate a new pair of Access Key ID and Secret Access Key for the user. Set them locally using next command:

```aws configure```

Verify the configuration by running the command: `aws ec2 describe-instance-types --instance-types t4g.nano`.

Create S3 bucket in you AWS account to store Terraform states. Use `providers.tf` for reference or update to your own values.

```
backend "s3" {
    region  = "eu-central-1"
    bucket  = "rss-devops-tfstate"
    key     = "state/terraform.tfstate"
    encrypt = true
}
```

### Use Terraform to deploy infra

Run next command to initialize Terraform

`terraform init`

Check changes that could be made to infra with:

`terraform plan`

If changes are 'OK', apply them with command:

`terraform apply`

### How to destroy resources

Use `terraform destroy` to remove all resources from the cloud provide and save :dollar:.

Happy coding!