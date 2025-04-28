resource "alicloud_cs_managed_kubernetes" "cluster" {
  name               = var.cluster_name
  cluster_spec       = var.cluster_spec
  vswitch_ids        = data.terraform_remote_state.vpc.outputs.private_vswitch_ids
  service_cidr       = var.service_cidr
  new_nat_gateway    = true
  security_group_id  = alicloud_security_group.k8s_sg.id
  proxy_mode         = var.forwarding_mode
  depends_on         = [alicloud_ram_role.cs_ai_assistant]

  addons {
    name = "terway-eniip"
    config = jsonencode({
      DataPathType = "V2"
    })
  }
  addons {
    name = "csi-plugin"
  }
  addons {
    name = "csi-provisioner"
  }
}
