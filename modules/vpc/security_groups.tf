resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  description = "Security group for public subnets"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 433
    to_port     = 433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security group for public subnets"
  }
}

resource "aws_security_group" "nat_sg" {
  name        = "nat_sg"
  description = "Security group for NAT instance"

  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_subnet.private_subnet_1.cidr_block, aws_subnet.private_subnet_2.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Security group for bastion host"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.admin_access_cidr_blocks
  }
}
