variable "vpc_id" {
  description = "Specify the VPC ID"
  type        = string
}

variable "VPC_subnet" {
  description = "Specify the VPC subnet"
  type        = string
}

variable "num_of_private_subnets" {
  description = "Specify the number of private subnets"
  type        = number
  default     = 9
}

variable "private_subnets_subnet_size" {
  description = "Specify the size of the subnet, i.e. network size plus x bits (/16 + 8 = /24)"
  type        = number
  default     = 8
}

variable "num_of_private_AZs_to_use" {
  description = "Specify the number of AZs for the private subnets"
  type        = number
  default     = 4
}

variable "private_subnet_name" {
  description = "Set the name for the private subnets"
  type        = string
  default     = "Private-Subnet"
}

