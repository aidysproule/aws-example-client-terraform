# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name   = "tag:Built_By"
    values = ["Terraform"] # insert values here
  }

  filter {
    name   = "tag:Subnet_type"
    values = ["Private_Subnet"] # insert values here
  }
}
