variable "vpc_subnet" {
  description = "Set the subnet for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}


variable "vpc_name" {
  description = "Set the name for the VPC"
  type        = string
  default     = "VPC 1"
}

variable "enable_dns_support" {
  description = "Enable/disable DNS support"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable/disable DNS hostnames"
  type        = bool
  default     = true
}