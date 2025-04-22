# 퍼블릭 VSwitch 생성
resource "alicloud_vswitch" "public" {
  count = length(var.public_vswitchs)

  vpc_id            = alicloud_vpc.main.id
  cidr_block        = var.public_vswitchs[count.index].cidr
  zone_id           = var.public_vswitchs[count.index].zone
  vswitch_name      = "${var.vpc_name}-${var.public_vswitchs[count.index].name}"
}

# 프라이빗 VSwitch 생성
resource "alicloud_vswitch" "private" {
  count = length(var.private_vswitchs)

  vpc_id            = alicloud_vpc.main.id
  cidr_block        = var.private_vswitchs[count.index].cidr
  zone_id           = var.private_vswitchs[count.index].zone
  vswitch_name      = "${var.vpc_name}-${var.private_vswitchs[count.index].name}"
} 
