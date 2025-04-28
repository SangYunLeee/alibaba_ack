vpc_name = "my-vpc"
vpc_cidr = "172.31.0.0/16"

# 퍼블릭 VSwitch 설정
public_vswitchs = [{
    name = "public-1"
    cidr = "172.31.0.0/20"
    zone = "cn-hangzhou-g"
}, {
    name = "public-2"
    cidr = "172.31.16.0/20"
    zone = "cn-hangzhou-h"
}]

# 프라이빗 VSwitch 설정
private_vswitchs = [{
    name = "private-1"
    cidr = "172.31.32.0/20"
    zone = "cn-hangzhou-g"
}, {
    name = "private-2"
    cidr = "172.31.48.0/20"
    zone = "cn-hangzhou-h"
}, {
    name = "private-3"
    cidr = "172.31.64.0/20"
    zone = "cn-hangzhou-i"
}]

# Bastion 서버 설정
create_bastion = false
bastion_instance_type = "ecs.t6-c4m1.large"
bastion_image_id = "ubuntu_20_04_x64_20G_alibase_20230718.vhd"
