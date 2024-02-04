variable "vpc_id" {
  description = "Specify the VPC ID"
  type        = string
}

variable "dmz_subnet_block" {
  description = "Specify the subnet block from which the subnets will be built"
  type        = string
  default     = "10.10.32.0/19"
}

variable "num_of_dmz_subnets" {
  description = "Specify the number of DMZ subnets"
  type        = number
  default     = 3
}

variable "dmz_subnets_subnet_size" {
  description = "Specify the size of the subnet, i.e. dmz_subnet_block plus x bits (/19 + 3 = /22 subnets)"
  type        = number
  default     = 3
}

variable "num_of_AZs_to_use" {
  description = "Specify the number of AZs for the DMZ subnets"
  type        = number
  default     = 3
}

variable "dmz_subnet_name" {
  description = "Set the name for the DMZ subnets"
  type        = string
  default     = "DMZ-Subnet"
}

