variable "vpc_id" {
  description = "Specify the VPC ID"
  type        = string
}

variable "IGW_name" {
  description = "Specify the name for the IGW"
  type        = string
  default     = "IGW"
}