output "dmz_subnet_ids" {
  value = data.aws_subnets.dmz_subnets.ids
}