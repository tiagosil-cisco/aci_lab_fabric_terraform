resource "aci_rest_managed" "globalDns" {
  dn         = "uni/fabric/dnsp-${var.global_dns_policy.dns.name}"
  class_name = "dnsProfile"
  content = {
    name = var.global_dns_policy.dns.name
  }
}

resource "aci_rest_managed" "globalDnsToEpg" {
  depends_on = [aci_rest_managed.globalDns]
  dn         = "uni/fabric/dnsp-${var.global_dns_policy.dns.name}/rsProfileToEpg"
  class_name = "dnsRsProfileToEpg"
  content = {
    tDn = "uni/tn-mgmt/mgmtp-default/${local.mgmt_epg}"
  }
}

resource "aci_rest_managed" "globalDnsProvider1" {
  depends_on = [aci_rest_managed.globalDns]
  dn         = "uni/fabric/dnsp-${var.global_dns_policy.dns.name}/prov-${var.global_dns_policy.dns.provider1.addr}"
  class_name = "dnsProv"
  content = {
    addr      = var.global_dns_policy.dns.provider1.addr
    preferred = var.global_dns_policy.dns.provider1.preferred
  }
}
resource "aci_rest_managed" "globalDnsProvider2" {
  depends_on = [aci_rest_managed.globalDns]
  dn         = "uni/fabric/dnsp-${var.global_dns_policy.dns.name}/prov-${var.global_dns_policy.dns.provider2.addr}"
  class_name = "dnsProv"
  content = {
    addr      = var.global_dns_policy.dns.provider2.addr
    preferred = var.global_dns_policy.dns.provider2.preferred
  }
}

resource "aci_rest_managed" "globalDnsDomain" {
  depends_on = [aci_rest_managed.globalDns]
  dn         = "uni/fabric/dnsp-${var.global_dns_policy.dns.name}/dom-${var.global_dns_policy.dns.domain.name}"
  class_name = "dnsDomain"
  content = {
    name      = var.global_dns_policy.dns.domain.name
    isDefault = var.global_dns_policy.dns.domain.default
  }
}