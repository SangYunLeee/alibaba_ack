resource "alicloud_security_group" "k8s_sg" {
  security_group_name   = "k8s-sg"
  vpc_id                = data.terraform_remote_state.vpc.outputs.vpc_id
  description           = "Kubernetes 클러스터용 시큐리티 그룹"
}

resource "alicloud_security_group_rule" "allow_k8s_api" {
  type              = "ingress"
  ip_protocol       = "tcp"
  port_range        = "6443/6443"
  security_group_id = alicloud_security_group.k8s_sg.id
  cidr_ip           = "0.0.0.0/0" # (운영 환경에서는 제한 권장)
}
