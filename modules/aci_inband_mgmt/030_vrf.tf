resource "aci_vrf" "inb" {
  tenant_dn              = local.tenant_dn
  name                   = var.vrf_inb.inb.name
  description            = var.vrf_inb.inb.description
  bd_enforced_enable     = var.vrf_inb.inb.bd_enforced_enable
  ip_data_plane_learning = var.vrf_inb.inb.ip_data_plane_learning
  pc_enf_dir             = var.vrf_inb.inb.pc_enf_dir
  pc_enf_pref            = var.vrf_inb.inb.pc_enf_pref

}