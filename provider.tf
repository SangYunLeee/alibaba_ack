terraform {
  required_providers {
    alicloud = {
      source = "aliyun/alicloud"
      version = "~> 1.209.0"
    }
  }
}

provider "alicloud" {
  # Alibaba Cloud 인증 정보는 환경 변수로 설정하거나 여기에 직접 입력할 수 있습니다.
  # access_key = "LTAI5tQg7wvbFuBxA~"
  # secret_key = "H1xUoqGY8UsvtByg1~"
  region     = "cn-hangzhou"
}
