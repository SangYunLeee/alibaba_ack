variable "vpc_name" {
  description = "VPC 이름"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR 블록"
  type        = string
}

variable "public_vswitchs" {
  description = "퍼블릭 VSwitch 설정 목록"
  type = list(object({
    name = string
    cidr = string
    zone = string
  }))
  default = []
}

variable "private_vswitchs" {
  description = "프라이빗 VSwitch 설정 목록"
  type = list(object({
    name = string
    cidr = string
    zone = string
  }))
  default = []
}

variable "availability_zones" {
  description = "가용 영역 목록"
  type        = list(list(string))
  default     = []
}

variable "create_bastion" {
  description = "Bastion 서버 생성 여부"
  type        = bool
  default     = false
}

variable "bastion_instance_type" {
  description = "Bastion 서버 인스턴스 타입"
  type        = string
  default     = "ecs.t6-c4m1.large"
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
  default     = "!ßß"
}
