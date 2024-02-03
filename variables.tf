variable "region" {
  description = "Set the region for the VPC"
  type        = string
  default     = "us-east-1"
}

variable "Default_Tags" {
  description = "Default tags applied to all resources"
  type        = map(string)
  default = {
    Built_By = "Terraform",
    enviornment = "Production",
  }
}

