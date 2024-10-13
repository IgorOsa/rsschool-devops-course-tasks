variable "aws_account_id" {
  type = string
}

variable "region" {
  type        = string
  default     = "eu-central-1"
  description = "AWS region"
}

variable "tags" {
  type = map(string)
  default = {
    project     = "rsschool-devops-course"
    environment = "dev"
  }
}

variable "admin_access_cidr_blocks" {
  description = "CIDR blocks for the admin access"
  type        = list(string)
}
