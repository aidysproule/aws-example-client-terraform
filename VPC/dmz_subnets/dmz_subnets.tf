resource "aws_subnet" "dmz_subnet" {
  vpc_id            = var.vpc_id
  count             = var.num_of_dmz_subnets
  cidr_block        = cidrsubnets(var.dmz_subnet_block, [for v in range(var.num_of_dmz_subnets) : var.dmz_subnets_subnet_size]...)[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % var.num_of_AZs_to_use]

  tags = {
    Name        = "${var.dmz_subnet_name}-${count.index + 1}"
    Subnet_type = "DMZ_Subnet"
  }
}