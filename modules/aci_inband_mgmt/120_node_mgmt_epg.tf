resource "aci_node_mgmt_epg" "in_band" {
  type                  = "in_band"
  management_profile_dn = "uni/tn-mgmt/mgmtp-default"
  name                  = local.inband_epg_name

  encap = "vlan-${local.inb_epg_vlan}"
}


/*
resource "aci_rest_managed" "node_mgmt_inb" {
  dn         = "uni/tn-mgmt/mgmtp-default/inb-${local.inband_epg_name}"
  class_name = "mgmtInB"
  content = {
    name      = local.inband_epg_name
    encap   = "vlan-${local.inband_epg_vlan}"
    //rn = "inb-${local.inband_epg_name}"

  }
}

resource "aci_rest_managed" "node_mgmt_inb_bd" {
  depends_on = [ aci_rest_managed.node_mgmt_inb ]
  dn         = "uni/tn-mgmt/mgmtp-default/inb-${local.inband_epg_name}/rsmgmtBD"
  class_name = "mgmtRsMgmtBD"
  content = {
    tnFvBDName = aci_bridge_domain.bd_inb.name

  }
}


resource "aci_rest_managed" "node_mgmt_inb_contract_prov" {
  depends_on = [ aci_rest_managed.node_mgmt_inb ]
  dn         = "uni/tn-mgmt/mgmtp-default/inb-${local.inband_epg_name}"
  class_name = "fvRsProv"
  content = {
    tnVzBrCPName = aci_contract.INBAND_CONTRACT.name
  }
}

resource "aci_rest_managed" "node_mgmt_inb_contract_cons" {
  depends_on = [ aci_rest_managed.node_mgmt_inb ]
  dn         = "uni/tn-mgmt/mgmtp-default/inb-${local.inband_epg_name}"
  class_name = "fvRsCons"
  content = {
    tnVzBrCPName = aci_contract.INBAND_CONTRACT.name
  }
}
*/