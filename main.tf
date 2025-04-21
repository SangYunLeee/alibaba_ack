# VPC 생성
resource "alicloud_vpc" "main" {
  vpc_name   = var.vpc_name
  cidr_block = var.vpc_cidr
}

# VSwitch 생성
resource "alicloud_vswitch" "main" {
  vpc_id            = alicloud_vpc.main.id
  cidr_block        = var.vswitch_cidrs[0]
  zone_id           = var.availability_zones[0]
  vswitch_name      = "${var.vpc_name}-vswitch"
} 