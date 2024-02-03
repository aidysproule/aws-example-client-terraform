# Configure the VPC
resource "aws_vpc" "main" {
  cidr_block           = var.VPC_subnet
  instance_tenancy     = "default"
  enable_dns_hostnames = var.enable_dns_support
  enable_dns_support   = var.enable_dns_support
  tags = {
    Name = var.vpc_name
  }
}