output "vpc_id" {
  value = aws_vpc.main.id
}

output "VPC_subnet" {
  value = var.VPC_subnet
}