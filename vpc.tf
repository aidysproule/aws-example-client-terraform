module "vpc" {
  source = "./VPC/vpc"

  VPC_subnet           = "10.10.0.0/16"
  vpc_name             = "Main VPC"
  enable_dns_support   = true
  enable_dns_hostnames = true
}



module "public_subnets" {
  source = "./VPC/public_subnets"

  vpc_id = module.vpc.vpc_id
  public_subnet_block                 = "10.10.0.0/19"
  num_of_public_subnets      = 3
  public_subnets_subnet_size = 3 #Specify the size of the subnet, i.e. VPC_subnet plus x bits (/19 + 3 = /22 subnets)
  num_of_public_AZs_to_use   = 3
  public_subnet_name         = "Public-Subnet"
  map_public_ip_on_launch    = true
}

module "dmz_subnets" {
  source = "./VPC/dmz_subnets"

  vpc_id = module.vpc.vpc_id
  dmz_subnet_block                  = "10.10.32.0/19"
  num_of_dmz_subnets      = 3
  dmz_subnets_subnet_size = 3 #Specify the size of the subnet, i.e. network size plus x bits (/16 + 8 = /24)
  num_of_AZs_to_use   = 3
  dmz_subnet_name         = "DMZ-Subnet"

}

/*
module "private_subnets" {
  source = "./VPC/private_subnets"

  vpc_id = module.vpc.vpc_id
  #VPC_subnet                 = module.vpc.VPC_subnet
  VPC_subnet                  = "10.10.16.0/20"
  num_of_private_subnets      = 3
  private_subnets_subnet_size = 4 #Specify the size of the subnet, i.e. network size plus x bits (/16 + 8 = /24)
  num_of_private_AZs_to_use   = 4
  private_subnet_name         = "Private-Subnet"

}

module "IGW" {
  source = "./VPC/IGW"

  vpc_id   = module.vpc.vpc_id
  IGW_name = "My Internet Gateway"
}

module "route_tables" {
  source = "./VPC/route_tables"

  vpc_id = module.vpc.vpc_id
  IGW_id = module.IGW.igw_id
  //sNAT_GW_id = module.nat_gateway.nat_gateway_id

  public_subnet_ids  = module.public_subnets.public_subnet_ids
  private_subnet_ids = module.private_subnets.private_subnet_ids

}
*/



/*
module "eip_nat_gateway" {
  source = "./VPC/EIP"
}

module "nat_gateway" {
  source = "./VPC/NAT_GW"

  eip_nat_gateway_id = module.eip_nat_gateway.eip_nat_gateway_id
  public_subnet_ids = module.public_subnets.public_subnet_ids[0]

  depends_on = [
    module.public_subnets,
    module.IGW,
    module.eip_nat_gateway
    ]
}
*/