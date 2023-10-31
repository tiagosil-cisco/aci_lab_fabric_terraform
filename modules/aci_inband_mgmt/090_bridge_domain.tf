resource "aci_bridge_domain" "bd_inb" {
  tenant_dn                = local.tenant_dn
  relation_fv_rs_ctx       = aci_vrf.inb.id
  name                     = var.bds.bd_inb.name
  relation_fv_rs_bd_to_out = [aci_l3_outside.L3OUT-BGP.id]
}


resource "aci_subnet" "bd_inb_subnet" {
  parent_dn = aci_bridge_domain.bd_inb.id
  ip        = join("/", [cidrhost(var.bds.bd_inb.subnet, 254), split("/", var.bds.bd_inb.subnet)[1]])
  scope     = ["public", "shared"]
  virtual   = "yes"
  preferred = "yes"
}

