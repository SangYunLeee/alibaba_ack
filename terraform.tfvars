vpc_name = "my-vpc"
vpc_cidr = "172.31.0.0/16"
vswitch_cidrs = ["172.31.0.0/20", "172.31.16.0/20"]
availability_zones = ["cn-hangzhou-g", "cn-hangzhou-h"]

# Bastion 서버 설정
create_bastion = true
bastion_instance_type = "ecs.t5-lc1m1.small"
bastion_image_id = "ubuntu_20_04_x64_20G_alibase_20230718.vhd"
bastion_key_name = "bastion-key"
