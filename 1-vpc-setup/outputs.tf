output "vpc_id" {
  description = "생성된 VPC의 ID"
  value       = alicloud_vpc.main.id
}

output "public_vswitch_ids" {
  description = "생성된 퍼블릭 VSwitch들의 ID"
  value       = alicloud_vswitch.public[*].id
}

output "private_vswitch_ids" {
  description = "생성된 프라이빗 VSwitch들의 ID"
  value       = alicloud_vswitch.private[*].id
}

output "vpc_cidr" {
  description = "VPC의 CIDR 블록"
  value       = alicloud_vpc.main.cidr_block
}