output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "bastion_host_public_ip" {
  value = aws_instance.bastion_host.public_ip
}

output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "private_subnet_ids" {
  value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}
