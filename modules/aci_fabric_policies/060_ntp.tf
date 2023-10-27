resource "aci_rest_managed" "ntp1" {
  dn         = "uni/fabric/time-${var.pod_policies.date_time.name}/ntpprov-${var.pod_policies.date_time.ntp1.name}"
  class_name = "datetimeNtpProv"
  content = {
    name      = var.pod_policies.date_time.ntp1.name
    minPoll   = var.pod_policies.date_time.ntp1.min_poll
    maxPoll   = var.pod_policies.date_time.ntp1.max_poll
    preferred = var.pod_policies.date_time.ntp1.preferred
    descr     = var.pod_policies.date_time.ntp1.description
  }
  child {
    rn         = "rsNtpProvToEpg"
    class_name = "datetimeRsNtpProvToEpg"
    content = {
      tDn = "uni/tn-mgmt/mgmtp-default/${local.mgmt_epg}"
    }
  }
}

resource "aci_rest_managed" "ntp2" {
  dn         = "uni/fabric/time-${var.pod_policies.date_time.name}/ntpprov-${var.pod_policies.date_time.ntp2.name}"
  class_name = "datetimeNtpProv"
  content = {
    name      = var.pod_policies.date_time.ntp2.name
    minPoll   = var.pod_policies.date_time.ntp2.min_poll
    maxPoll   = var.pod_policies.date_time.ntp2.max_poll
    preferred = var.pod_policies.date_time.ntp2.preferred
    descr     = var.pod_policies.date_time.ntp2.description
  }
  child {
    rn         = "rsNtpProvToEpg"
    class_name = "datetimeRsNtpProvToEpg"
    content = {
      tDn = "uni/tn-mgmt/mgmtp-default/${local.mgmt_epg}"
    }
  }
}
