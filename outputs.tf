output "vpc_id" {
  description = "생성된 VPC의 ID"
  value       = alicloud_vpc.main.id
}

output "vswitch_ids" {
  description = "생성된 VSwitch들의 ID"
  value       = alicloud_vswitch.main[*].id
}

output "vpc_cidr" {
  description = "VPC의 CIDR 블록"
  value       = alicloud_vpc.main.cidr_block
}