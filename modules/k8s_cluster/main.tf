resource "aws_instance" "k8s_master" {
  ami                         = "ami-0592c673f0b1e7665"
  instance_type               = var.k8s_master_instance_type
  associate_public_ip_address = true
  availability_zone           = var.availability_zones[0]
  subnet_id                   = var.private_subnet_ids[0]
  vpc_security_group_ids      = [aws_security_group.k8s_master_sg.id]
  key_name                    = "my_secure_keypair"

  tags = {
    Name = "K8s Master"
  }
}

resource "aws_instance" "k8s_worker_1" {
  ami                         = "ami-0592c673f0b1e7665"
  instance_type               = var.k8s_worker_instance_type
  associate_public_ip_address = true
  availability_zone           = var.availability_zones[1]
  subnet_id                   = var.private_subnet_ids[1]
  vpc_security_group_ids      = [aws_security_group.k8s_worker_sg.id]
  key_name                    = "my_secure_keypair"

  tags = {
    Name = "K8s Worker 1"
  }
}

resource "aws_security_group" "k8s_master_sg" {
  name        = "k8s_master_sg"
  description = "Security group for k8s master"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.bastion_host_public_ip}/32"]
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["${var.bastion_host_public_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security group for k8s master"
  }
}

resource "aws_security_group" "k8s_worker_sg" {
  name        = "k8s_worker_sg"
  description = "Security group for k8s worker"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.bastion_host_public_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security group for k8s worker"
  }
}
