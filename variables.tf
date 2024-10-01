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
