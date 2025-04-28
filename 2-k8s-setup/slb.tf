resource "alicloud_slb_load_balancer" "k8s_slb" {
  load_balancer_name = "k8s-slb"
  address_type       = "internet"
  load_balancer_spec = "slb.s1.small"
  vswitch_id         = data.terraform_remote_state.vpc.outputs.private_vswitch_ids[0]
  payment_type       = "PayAsYouGo"
}
