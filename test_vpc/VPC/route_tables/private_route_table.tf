
resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  /*
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.NAT_GW_id
  }
  */

  tags = {
    Name = var.private_route_table_name
  }
}

resource "aws_route_table_association" "private_rt_to_private_subnet" {
  for_each       = toset(var.private_subnet_ids)
  subnet_id      = each.value
  route_table_id = aws_route_table.private_route_table.id
}

