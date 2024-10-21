resource "aws_network_acl" "K8S_public_nacl" {
  vpc_id = aws_vpc.vpc.id

  # Allow all inbound traffic
  ingress {
    rule_no    = 100
    protocol   = "-1" # All protocols
    from_port  = 0
    to_port    = 0
    cidr_block = "0.0.0.0/0"
    action     = "allow"
  }

  # Allow all outbound traffic
  egress {
    protocol   = -1
    rule_no    = 100
    from_port  = 0
    to_port    = 0
    cidr_block = "0.0.0.0/0"
    action     = "allow"
  }

  tags = {
    Name = "K8S Public NACL"
  }
}
