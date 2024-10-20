variable "tags" {
  type    = map(string)
  default = {}
}

variable "k8s_cluster_name" {
  description = "Name of the k8s cluster"
  type        = string
}

variable "k8s_master_instance_type" {
  description = "Instance type for the k8s master"
  type        = string
  default     = "t2.micro"
}

variable "k8s_worker_instance_type" {
  description = "Instance type for the k8s worker"
  type        = string
  default     = "t2.micro"
}

variable "bastion_host_public_ip" {
  description = "Bastion host public IP"
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}
