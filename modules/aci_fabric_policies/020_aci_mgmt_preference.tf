resource "aci_mgmt_preference" "mgmtConnectivityPref" {
  interface_pref = var.apic_conn_pref.apic_conn_pref
}
