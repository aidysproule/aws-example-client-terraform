# ********** VPC **********
module "vpc" {
  source = "./VPC/vpc"

  vpc_subnet           = "10.10.0.0/16"
  vpc_name             = "Production VPC"
  enable_dns_support   = true
  enable_dns_hostnames = true
}
# ********** VPC **********


# ********** Public Subnets **********
module "public_subnets" {
  source = "./VPC/public_subnets"

  vpc_id = module.vpc.vpc_id
  public_subnet_block                 = "10.10.0.0/19"
  num_of_public_subnets      = 3
  public_subnets_subnet_size = 3 # Specify the size of the subnet, i.e. public_subnet_block plus x bits (/19 + 3 = /22 subnets)
  num_of_public_AZs_to_use   = 3
  public_subnet_name         = "Public-Subnet"
  map_public_ip_on_launch    = true
}
# ********** Public Subnets **********


# ********** DMZ Subnets (Private) **********
module "dmz_subnets" {
  source = "./VPC/dmz_subnets"

  vpc_id = module.vpc.vpc_id
  dmz_subnet_block                  = "10.10.32.0/19"
  num_of_dmz_subnets      = 3
  dmz_subnets_subnet_size = 3 # Specify the size of the subnet, i.e. public_subnet_blockt plus x bits (/19 + 3 = /22 subnets)
  num_of_AZs_to_use   = 3
  dmz_subnet_name         = "DMZ-Subnet"

}
# ********** DMZ Subnets (Private) **********


# ********** Private Subnets **********
module "private_subnets" {
  source = "./VPC/private_subnets"

  vpc_id = module.vpc.vpc_id
  private_subnet_block                  = "10.10.64.0/19"
  num_of_private_subnets      = 3
  private_subnets_subnet_size = 3 # Specify the size of the subnet, i.e. public_subnet_blockt plus x bits (/19 + 3 = /22 subnets)
  num_of_AZs_to_use   = 3
  private_subnet_name         = "Private-Subnet"

}
# ********** Private Subnets **********


# ********** Internet Gateway **********
module "IGW" {
  source = "./VPC/IGW"

  vpc_id   = module.vpc.vpc_id
  IGW_name = "IGW-Production"
}
# ********** Internet Gateway **********


# ********** Public Subnets Default Route **********
resource "aws_route_table" "public_route_table" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.IGW.igw_id
  }

  tags = {
    Name = "Public Subnets Route Table"
  }
}

resource "aws_route_table_association" "public_rt_to_public_subnet" {
  for_each       = toset(module.public_subnets.public_subnet_ids)
  subnet_id      = each.value
  route_table_id = aws_route_table.public_route_table.id
}
# ********** Public Subnets Default Route **********


# ********** NAT Gateway **********
resource "aws_eip" "nat_gateway_eip" {
  domain = "vpc"
  tags = {
    Name = "NAT Gateway EIP"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = module.public_subnets.public_subnet_ids[0]

  tags = {
    Name = "Production-NAT-Gateway"
  }
}
# ********** NAT Gateway **********


# ********** DMZ Subnets Default Route **********
resource "aws_route_table" "dmz_route_table" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "DMZ Subnets Route Table"
  }
}

resource "aws_route_table_association" "dmz_rt_to_dmz_subnet" {
  for_each       = toset(module.dmz_subnets.dmz_subnet_ids)
  subnet_id      = each.value
  route_table_id = aws_route_table.dmz_route_table.id

  depends_on = [
    module.public_subnets,
    module.IGW,
    aws_eip.nat_gateway_eip,
    aws_nat_gateway.nat_gateway
    ]
}
# ********** DMZ Subnets Default Route **********


# ********** Private Subnets Default Route **********
resource "aws_route_table" "private_route_table" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "Private Subnets Route Table"
  }
}

resource "aws_route_table_association" "private_rt_to_private_subnet" {
  for_each       = toset(module.private_subnets.private_subnet_ids)
  subnet_id      = each.value
  route_table_id = aws_route_table.private_route_table.id

  depends_on = [
    module.public_subnets,
    module.IGW,
    aws_eip.nat_gateway_eip,
    aws_nat_gateway.nat_gateway
    ]
}
# ********** Private Subnets Default Route **********