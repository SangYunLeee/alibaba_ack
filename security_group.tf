# 보안 그룹 생성
resource "alicloud_security_group" "main" {
  name        = "${var.vpc_name}-sg"
  vpc_id      = alicloud_vpc.main.id
  description = "Security group for ${var.vpc_name}"
}

# 보안 그룹 규칙 추가 (예시: SSH 접속 허용)
resource "alicloud_security_group_rule" "allow_ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.main.id
  cidr_ip           = "211.218.18.43/32"
  description       = "Allow SSH access from specific IP range"
}
