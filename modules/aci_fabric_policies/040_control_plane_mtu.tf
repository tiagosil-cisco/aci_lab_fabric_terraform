resource "aci_rest_managed" "controlPlaneMtu" {
  dn         = "uni/infra/CPMtu"
  class_name = "infraCPMtuPol"
  content = {
    CPMtu = can(var.control_plane_mtu.control_plane_mtu) ? var.control_plane_mtu.control_plane_mtu : null
  }
}