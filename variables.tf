variable "vpc_name" {
  description = "VPC의 이름"
  type        = string
  default     = "my-vpc"
}

variable "vpc_cidr" {
  description = "VPC의 CIDR 블록"
  type        = string
  default     = "172.31.0.0/16"  # 65,536개 IP
}

variable "vswitch_cidrs" {
  description = "VSwitch들의 CIDR 블록"
  type        = list(string)
  default     = ["172.31.0.0/20"]  # 4,096개 IP
}

variable "availability_zones" {
  description = "가용 영역 목록"
  type        = list(string)
  default     = ["cn-hangzhou-g"]  # Hangzhou Zone G
}
