resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  count             = var.num_of_private_subnets
  cidr_block        = cidrsubnets(var.VPC_subnet, [for v in range(var.num_of_private_subnets) : var.private_subnets_subnet_size]...)[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % var.num_of_private_AZs_to_use]

  tags = {
    Name        = "${var.private_subnet_name}-${count.index + 1}"
    Subnet_type = "Private_Subnet"
  }
}