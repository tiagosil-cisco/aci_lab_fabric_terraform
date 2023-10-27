resource "aci_rest_managed" "fabricPodPolicyGroup" {
  dn         = "uni/fabric/funcprof/podpgrp-${var.pod_policy_group.name}"
  class_name = "fabricPodPGrp"
  content = {
    name = var.pod_policy_group.name
  }
}

resource "aci_rest_managed" "fabricPodPolicyGroupSnmp" {
  depends_on = [aci_rest_managed.fabricPodPolicyGroup]
  dn         = "uni/fabric/funcprof/podpgrp-${var.pod_policy_group.name}/rssnmpPol"
  class_name = "fabricRsSnmpPol"
  content = {
    tnSnmpPolName = var.pod_policy_group.snmp
  }
}

resource "aci_rest_managed" "fabricPodPolicyGroupPodPGrpIsisDomP" {
  depends_on = [aci_rest_managed.fabricPodPolicyGroup]
  dn         = "uni/fabric/funcprof/podpgrp-${var.pod_policy_group.name}/rspodPGrpIsisDomP"
  class_name = "fabricRsPodPGrpIsisDomP"
  content = {
    tnIsisDomPolName = var.pod_policy_group.isis
  }
}

resource "aci_rest_managed" "fabricPodPolicyGroupCoop" {
  depends_on = [aci_rest_managed.fabricPodPolicyGroup]
  dn         = "uni/fabric/funcprof/podpgrp-${var.pod_policy_group.name}/rspodPGrpCoopP"
  class_name = "fabricRsPodPGrpCoopP"
  content = {
    tnCoopPolName = var.pod_policy_group.coop
  }
}

resource "aci_rest_managed" "fabricPodPolicyGroupDateTime" {
  depends_on = [aci_rest_managed.fabricPodPolicyGroup]
  dn         = "uni/fabric/funcprof/podpgrp-${var.pod_policy_group.name}/rsTimePol"
  class_name = "fabricRsTimePol"
  content = {
    tnDatetimePolName = var.pod_policy_group.date_time
  }
}

resource "aci_rest_managed" "fabricPodPolicyGroupMacSec" {
  depends_on = [aci_rest_managed.fabricPodPolicyGroup]
  dn         = "uni/fabric/funcprof/podpgrp-${var.pod_policy_group.name}/rsmacsecPol"
  class_name = "fabricRsMacsecPol"
  content = {
    tnMacsecFabIfPolName = var.pod_policy_group.macsec
  }
}

resource "aci_rest_managed" "fabricPodPolicyGroupMgmtAccess" {
  depends_on = [aci_rest_managed.fabricPodPolicyGroup]
  dn         = "uni/fabric/funcprof/podpgrp-${var.pod_policy_group.name}/rsCommPol"
  class_name = "fabricRsCommPol"
  content = {
    tnCommPolName = var.pod_policy_group.management_access
  }
}

resource "aci_rest_managed" "fabricPodPolicyBGPRR" {
  depends_on = [aci_rest_managed.fabricPodPolicyGroup]
  dn         = "uni/fabric/funcprof/podpgrp-${var.pod_policy_group.name}/rspodPGrpBGPRRP"
  class_name = "fabricRsPodPGrpBGPRRP"
  content = {
    tnBgpInstPolName = var.pod_policy_group.bgp_rr
  }
}

resource "aci_rest_managed" "fabricPodProfileSelector" {
  depends_on = [aci_rest_managed.fabricPodPolicyGroup]
  dn         = "uni/fabric/podprof-${var.pod_profile.name}/pods-${var.pod_profile.selector.name}-typ-${var.pod_profile.selector.type}"
  class_name = "fabricPodS"
  content = {
    name = var.pod_profile.selector.name
    type = var.pod_profile.selector.type
  }
}

resource "aci_rest_managed" "fabricPodProfile" {
  depends_on = [aci_rest_managed.fabricPodPolicyGroup]
  dn         = "uni/fabric/podprof-${var.pod_profile.name}"
  class_name = "fabricPodP"
  content = {
    name = var.pod_profile.name
  }
}



resource "aci_rest_managed" "fabricPodProfileSelectorToGrp" {
  depends_on = [aci_rest_managed.fabricPodProfileSelector]
  dn         = "uni/fabric/podprof-${var.pod_profile.name}/pods-${var.pod_profile.selector.name}-typ-${var.pod_profile.selector.type}/rspodPGrp"
  class_name = "fabricRsPodPGrp"
  content = {
    tDn = "uni/fabric/funcprof/podpgrp-${var.pod_profile.selector.pod_policy_group}"
  }
}

