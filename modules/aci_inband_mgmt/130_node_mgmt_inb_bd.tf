resource "aci_rest_managed" "node_mgmt_inb_bd" {
  depends_on = [aci_node_mgmt_epg.in_band]
  dn         = "uni/tn-mgmt/mgmtp-default/inb-${local.inband_epg_name}/rsmgmtBD"
  class_name = "mgmtRsMgmtBD"
  content = {
    tnFvBDName = aci_bridge_domain.bd_inb.name

  }
}
/*
resource "aci_rest_managed" "node_mgmt_inb_contract_prov" {
  depends_on = [ aci_node_mgmt_epg.in_band ]
  dn         = "uni/tn-mgmt/mgmtp-default/inb-${local.inband_epg_name}"
  class_name = "fvRsProv"
  content = {
    tnVzBrCPName = "INBAND_CONTRACT"
  }
}

resource "aci_rest_managed" "node_mgmt_inb_contract_cons" {
  depends_on = [ aci_node_mgmt_epg.in_band ]
  dn         = "uni/tn-mgmt/mgmtp-default/inb-${local.inband_epg_name}"
  class_name = "fvRsCons"
  content = {
    tnVzBrCPName = aci_contract.INBAND_CONTRACT.name
  }
}
*/
resource "aci_rest_managed" "node_mgmt_inb_contract_prov" {
  depends_on = [ aci_node_mgmt_epg.in_band ]
  dn         = "uni/tn-mgmt/mgmtp-default/inb-${local.inband_epg_name}/rsprov-${aci_contract.INBAND_CONTRACT.name}"
  class_name = "fvRsProv"
  content = {
    tnVzBrCPName = aci_contract.INBAND_CONTRACT.name
  }
} 

resource "aci_rest_managed" "node_mgmt_inb_contract_cons" {
  depends_on = [ aci_node_mgmt_epg.in_band ]
  dn         = "uni/tn-mgmt/mgmtp-default/inb-${local.inband_epg_name}/rscons-${aci_contract.INBAND_CONTRACT.name}"
  class_name = "fvRsCons"
  content = {
    tnVzBrCPName = aci_contract.INBAND_CONTRACT.name
  }
} 