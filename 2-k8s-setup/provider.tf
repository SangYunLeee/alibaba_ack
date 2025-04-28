terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "~> 1.248.0"
    }
  }
}

provider "alicloud" {
  region = "cn-hangzhou"
}

https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_managed_kubernetes#argument-reference