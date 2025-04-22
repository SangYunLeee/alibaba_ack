# 퍼블릭 보안 그룹 생성
resource "alicloud_security_group" "public" {
  name        = "${var.vpc_name}-public-sg"
  vpc_id      = alicloud_vpc.main.id
  description = "Public security group for ${var.vpc_name}"
}

# 퍼블릭 보안 그룹 규칙
resource "alicloud_security_group_rule" "public_http" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "80/80"
  priority          = 1
  security_group_id = alicloud_security_group.public.id
  cidr_ip           = "0.0.0.0/0"
  description       = "Allow HTTP access"
}

resource "alicloud_security_group_rule" "public_https" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "443/443"
  priority          = 1
  security_group_id = alicloud_security_group.public.id
  cidr_ip           = "0.0.0.0/0"
  description       = "Allow HTTPS access"
}

# Bastion 보안 그룹 생성
resource "alicloud_security_group" "bastion" {
  name        = "${var.vpc_name}-bastion-sg"
  vpc_id      = alicloud_vpc.main.id
  description = "Bastion security group for ${var.vpc_name}"
}

# Bastion 보안 그룹 규칙
resource "alicloud_security_group_rule" "bastion_ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.bastion.id
  cidr_ip           = "211.218.18.43/32"
  description       = "Allow SSH access from specific IP"
}

# 프라이빗 보안 그룹 생성
resource "alicloud_security_group" "private" {
  name        = "${var.vpc_name}-private-sg"
  vpc_id      = alicloud_vpc.main.id
  description = "Private security group for ${var.vpc_name}"
}

# 프라이빗 보안 그룹 규칙
resource "alicloud_security_group_rule" "private_all" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "1/65535"
  priority          = 1
  security_group_id = alicloud_security_group.private.id
  cidr_ip           = "172.31.0.0/16"
  description       = "Allow all traffic from VPC"
}

# DB 보안 그룹 생성
resource "alicloud_security_group" "db" {
  name        = "${var.vpc_name}-db-sg"
  vpc_id      = alicloud_vpc.main.id
  description = "DB security group for ${var.vpc_name}"
}

# DB 보안 그룹 규칙
resource "alicloud_security_group_rule" "db_mysql" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "3306/3306"
  priority          = 1
  security_group_id = alicloud_security_group.db.id
  cidr_ip           = "172.31.0.0/16"
  description       = "Allow MySQL access from VPC"
}
