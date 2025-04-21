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
