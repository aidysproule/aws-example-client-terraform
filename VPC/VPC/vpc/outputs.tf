output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_subnet" {
  value = var.vpc_subnet
}