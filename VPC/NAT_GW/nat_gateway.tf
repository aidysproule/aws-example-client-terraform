resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = var.eip_nat_gateway_id
  subnet_id     = var.public_subnet_ids
}