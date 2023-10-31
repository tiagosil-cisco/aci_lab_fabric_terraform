resource "aci_application_profile" "ap" {
  tenant_dn = local.tenant_dn
  name      = local.inband_epg_name
}