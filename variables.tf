variable "vpc_name" {
  description = "VPC 이름"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR 블록"
  type        = string
}

variable "vswitch_cidrs" {
  description = "VSwitch CIDR 블록 목록"
  type        = list(string)
}

variable "availability_zones" {
  description = "가용 영역 목록"
  type        = list(string)
}

variable "create_bastion" {
  description = "Bastion 서버 생성 여부"
  type        = bool
  default     = false
}

variable "bastion_instance_type" {
  description = "Bastion 서버 인스턴스 타입"
  type        = string
  default     = "ecs.t5-lc1m1.small"
}

variable "bastion_image_id" {
  description = "Bastion 서버 이미지 ID"
  type        = string
  default     = "ubuntu_20_04_x64_20G_alibase_20230718.vhd"
}

variable "bastion_password" {
  description = "Bastion 서버 비밀번호"
  type        = string
  sensitive   = true
  default     = "mypassword!2#"  # 기본값 설정
}
