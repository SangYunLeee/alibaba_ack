output "cluster_id" {
  value = alicloud_cs_managed_kubernetes.cluster.id
}

output "kube_config" {
  value = alicloud_cs_managed_kubernetes.cluster.kube_config
  sensitive = true
} 
