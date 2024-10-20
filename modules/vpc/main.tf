resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "VPC"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Internet GW"
  }
}

resource "aws_network_acl_association" "K8S_public_nacl_association_1" {
  network_acl_id = aws_network_acl.K8S_public_nacl.id
  subnet_id      = aws_subnet.public_subnet_1.id
}

resource "aws_network_acl_association" "K8S_public_nacl_association_2" {
  network_acl_id = aws_network_acl.K8S_public_nacl.id
  subnet_id      = aws_subnet.public_subnet_2.id
}
