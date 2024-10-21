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

Refer to `terraform.tfvars.example` file provide your variables and save them into `terraform.tfvars`.

### Use Terraform to deploy infra

Run next command to initialize Terraform

`terraform init`

Check changes that could be made to infra with:

`terraform plan`

If changes are 'OK', apply them with command:

`terraform apply`

### How to destroy resources

Use `terraform destroy` to remove all resources from the cloud provide and save :dollar:.

## Resources Created

- **VPC**: A virtual private cloud (VPC) with configurable CIDR block.
- **Subnets**: Two public and two private subnets across two availability zones for high availability.
- **Internet Gateway**: An internet gateway attached to the VPC to allow communication between instances in the VPC and the internet.
- **Route Tables**: Separate route tables for public and private subnets. The public route table routes traffic to the internet gateway, while the private route table routes traffic to a NAT instance.
- **Security Groups**: 
  - `public_sg`: Security group for public subnets allowing HTTP and HTTPS traffic.
  - `nat_sg`: Security group for the NAT instance allowing all traffic from the private subnets.
  - `bastion_sg`: Security group for the bastion host allowing SSH access from specified admin CIDR blocks.
- **Instances**:
  - **NAT Instance**: An EC2 instance acting as a NAT for instances in private subnets to access the internet indirectly.
  - **Bastion Host**: An EC2 instance in a public subnet to provide secure SSH access to instances in private subnets.
- **Network Interfaces**: A network interface attached to the NAT instance for handling traffic routing.
- **Route Table Associations**: Associations between subnets and their respective route tables.

## Variables

- `aws_account_id`: AWS account ID.
- `vpc_cidr_block`: CIDR block for the VPC.
- `public_subnet_cidr_blocks`: List of CIDR blocks for public subnets.
- `private_subnet_cidr_blocks`: List of CIDR blocks for private subnets.
- `admin_access_cidr_blocks`: CIDR blocks allowed for admin access to the bastion host.
- `availability_zones`: List of availability zones.
- `tags`: Additional tags that can be applied to resources.


Happy coding!