resource "aws_eip" "nat_gateway_eip" {
  domain = "vpc"
}