resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  count                   = var.num_of_public_subnets
  cidr_block              = cidrsubnets(var.VPC_subnet, [for v in range(var.num_of_public_subnets) : var.public_subnets_subnet_size]...)[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index % var.num_of_public_AZs_to_use]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name        = "${var.public_subnet_name}-${count.index + 1}"
    Subnet_type = "Public"
  }
}