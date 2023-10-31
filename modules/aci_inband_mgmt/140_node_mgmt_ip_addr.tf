resource "aci_static_node_mgmt_address" "static_addr" {
  for_each          = var.fabric_nodes
  management_epg_dn = aci_node_mgmt_epg.in_band.id
  t_dn              = "topology/pod-1/node-${each.value.node_id}"
  type              = "in_band"
  addr              = join("/", [cidrhost(var.bds.bd_inb.subnet, each.value.node_id), split("/", var.bds.bd_inb.subnet)[1]])
  gw                = split("/", aci_subnet.bd_inb_subnet.ip)[0]

}


/*
resource "aci_rest_managed" "node_mgmt_addr" {
  depends_on = [ aci_rest_managed.node_mgmt_inb ]
  dn         = "uni/infra"
  class_name = "infraInfra"
  child {
    rn         = "rsNtpProvToEpg"
    class_name = "datetimeRsNtpProvToEpg"
    content = {
      tDn = "uni/tn-mgmt/mgmtp-default/${local.mgmt_epg}"
    }
  }
}
*/