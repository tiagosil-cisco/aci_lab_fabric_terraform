resource "aci_filter" "match_all" {
  tenant_dn = local.tenant_dn
  name      = "match_all"
}

resource "aci_filter_entry" "match_all" {
  name      = "match_all"
  filter_dn = aci_filter.match_all.id
  ether_t   = "ip"
  stateful  = "yes"
}


resource "aci_contract" "INBAND_CONTRACT" {
  tenant_dn = local.tenant_dn
  name      = "INBAND_CONTRACT"
  scope     = "tenant"
}

resource "aci_contract" "INBAND_EXTEPG_CONTRACT" {
  tenant_dn = local.tenant_dn
  name      = "INBAND_EXTEPG_CONTRACT"
  scope     = "tenant"
}

resource "aci_contract_subject" "INBAND_allow_all" {
  contract_dn                  = aci_contract.INBAND_CONTRACT.id
  name                         = "allow_all"
  relation_vz_rs_subj_filt_att = [aci_filter.match_all.id]
}

resource "aci_contract_subject" "INBAND_EXTEPG_allow_all" {
  contract_dn                  = aci_contract.INBAND_EXTEPG_CONTRACT.id
  name                         = "allow_all"
  relation_vz_rs_subj_filt_att = [aci_filter.match_all.id]
}