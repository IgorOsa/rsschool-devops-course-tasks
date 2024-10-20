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

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b"]
}
