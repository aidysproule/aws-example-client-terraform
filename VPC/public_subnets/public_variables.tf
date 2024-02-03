variable "vpc_id" {
  description = "Specify the VPC ID"
  type        = string
}

variable "public_subnet_block" {
  description = "Specify the VPC subnet"
  type        = string
}

variable "num_of_public_subnets" {
  description = "Specify the number of public subnets"
  type        = number
  default     = 9
}

variable "public_subnets_subnet_size" {
  description = "Specify the size of the subnet, i.e. network size plus x bits (/16 + 8 = /24)"
  type        = number
  default     = 8
}

variable "num_of_public_AZs_to_use" {
  description = "Specify the number of AZs for the public subnets"
  type        = number
  default     = 4
}

variable "public_subnet_name" {
  description = "Set the name for the public subnets"
  type        = string
  default     = "Public-Subnet"
}

variable "map_public_ip_on_launch" {
  description = "Enable/disable public IP address on interface when NIC created in the subnet"
  type        = bool
  default     = true
}