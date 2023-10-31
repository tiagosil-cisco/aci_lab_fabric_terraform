resource "aci_application_epg" "epg_inb" {

  application_profile_dn = aci_application_profile.ap.id
  name                   = local.inband_epg_name
  relation_fv_rs_bd      = aci_bridge_domain.bd_inb.id
}


