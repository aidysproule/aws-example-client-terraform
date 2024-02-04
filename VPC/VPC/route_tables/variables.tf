variable "public_route_table_name" {
  description = "Specify the name of the public route table"
  type        = string
  default     = "Public Route Table"
}

variable "vpc_id" {
  description = "Specify the VPC ID"
  type        = string
}

variable "IGW_id" {
  description = "Specify the IGW ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Specify the list of public subnet IDs"
  type        = list(any)
}

###########################################

variable "private_route_table_name" {
  description = "Specify the name of the private route table"
  type        = string
  default     = "Private Route Table"
}

variable "private_subnet_ids" {
  description = "Specify the list of private subnet IDs"
  type        = list(any)
}

variable "NAT_GW_id" {
  description = "Specify the NAT GW ID"
  type        = string
  default     = ""
}