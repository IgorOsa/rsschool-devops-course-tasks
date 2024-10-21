resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr_blocks[0]
  availability_zone = var.availability_zones[0]

  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr_blocks[1]
  availability_zone = var.availability_zones[1]

  tags = {
    Name = "Public Subnet 2"
  }
}
