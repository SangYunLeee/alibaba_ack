variable "cluster_name" {
  description = "ACK 클러스터 이름"
  type        = string
  default     = "ack-cluster"
}

variable "cluster_spec" {
  description = "ACK 클러스터 스펙"
  type        = string
  default     = "ack.pro.small"
}

variable "worker_instance_type" {
  description = "워커 노드 인스턴스 타입"
  type        = string
  default     = "ecs.e-c1m1.large"
}

variable "worker_number" {
  description = "워커 노드 수"
  type        = number
  default     = 2
}

variable "pod_cidr" {
  description = "Pod CIDR"
  type        = string
  default     = "172.20.0.0/16"
}

variable "service_cidr" {
  description = "Service CIDR"
  type        = string
  default     = "172.21.0.0/20"
}
variable "forwarding_mode" {
  description = "Kubernetes 서비스 포워딩 모드 (ipvs 또는 iptables)"
  type        = string
  default     = "ipvs"
}
