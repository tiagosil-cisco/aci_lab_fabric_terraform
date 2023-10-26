# Variable domain DNs
variable "domain_prefix" {
  default = {
    vmware = "uni/vmmp-VMware/dom"
    l3dom  = "uni/l3dom"
    phys   = "uni/phys"
  }
}

# Attachable Entity Profile
resource "aci_attachable_access_entity_profile" "aaeps" {
  for_each                = var.aaeps
  name                    = each.key
  relation_infra_rs_dom_p = [for f in each.value.domain : "${var.domain_prefix[var.domains["${f}"].type]}-${f}"]
}