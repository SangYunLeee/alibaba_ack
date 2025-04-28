cluster_name         = "ack-cluster"
cluster_spec         = "ack.pro.small"
worker_instance_type = "ecs.e-c1m1.large"
worker_number        = 2
service_cidr         = "172.21.0.0/20"
forwarding_mode      = "ipvs"