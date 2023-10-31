/*
data "aci_attachable_access_entity_profile" "dev_ent_prof" {
  name  = local.aaep    
}
*/

resource "aci_aaep_to_domain" "aaep_to_domain" {
  for_each                            = var.aaeps
  attachable_access_entity_profile_dn = "uni/infra/attentp-${local.aaep}"
  domain_dn                           = aci_l3_domain_profile.l3_doms[each.value.domain].id
}
