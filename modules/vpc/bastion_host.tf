resource "aws_instance" "bastion_host" {
  ami                         = "ami-0592c673f0b1e7665"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  availability_zone           = var.availability_zones[0]
  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  key_name                    = "my_secure_keypair"

  tags = {
    Name = "Bastion Host"
  }
}
