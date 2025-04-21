# Bastion 서버 생성
resource "alicloud_instance" "bastion" {
  count = var.create_bastion ? 1 : 0

  instance_name        = "${var.vpc_name}-bastion"
  instance_type        = var.bastion_instance_type
  image_id             = var.bastion_image_id
  vswitch_id           = alicloud_vswitch.main.id
  security_groups      = [alicloud_security_group.main.id]
  key_name             = var.bastion_key_name
  system_disk_category = "cloud_efficiency"
  system_disk_size     = 20

  tags = {
    Name = "${var.vpc_name}-bastion"
    Role = "bastion"
  }
}

# Bastion 서버 EIP 할당
resource "alicloud_eip" "bastion" {
  count = var.create_bastion ? 1 : 0

  bandwidth            = "5"
  internet_charge_type = "PayByTraffic"
}

# EIP를 Bastion 서버에 연결
resource "alicloud_eip_association" "bastion" {
  count = var.create_bastion ? 1 : 0

  allocation_id = alicloud_eip.bastion[0].id
  instance_id   = alicloud_instance.bastion[0].id
} 