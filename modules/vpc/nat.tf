resource "aws_instance" "nat_instance" {
  ami                         = "ami-0592c673f0b1e7665"
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  availability_zone           = var.availability_zones[0]
  hibernation                 = false
  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.nat_sg.id]
  source_dest_check           = false
  user_data_replace_on_change = false

  user_data = file("${path.module}/nat-setup.sh")

  tags = {
    "Name" = "NAT instance"
  }
}

output "nat_instance_public_ip" {
  value = aws_instance.nat_instance.public_ip
}

resource "aws_network_interface" "nat_eni" {
  subnet_id       = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.nat_sg.id]

  attachment {
    instance     = aws_instance.nat_instance.id
    device_index = 1
  }

  tags = {
    Name = "NAT ENI"
  }
}
