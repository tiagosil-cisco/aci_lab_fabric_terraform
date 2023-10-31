locals {
  mgmt_epg                 = "inb-InBand_EPG"
  l3out_name               = "L3OUT-INB"
  leaf_a                   = "103"
  leaf_a_router_id         = "10.255.255.103"
  leaf_b                   = "104"
  leaf_b_router_id         = "10.255.255.104"
  l3out_int_port_group     = "VPC_to_OTT-CORE"
  l3out_svi_vlan           = 500
  l3out_subnet             = "10.0.5.0/29"
  bgp_local_as             = "65002"
  bgp_remote_as            = "65001"
  aaep                     = "OTT-CORE-MAIN-VPC-AAEP"
  tenant_dn                = "uni/tn-mgmt"
  application_profile_name = "INBAND"
  inband_epg_name          = "INBAND"
  inb_epg_vlan             = "9"
}

variable "credentials" {}
variable "project_name" {}


variable "vrf_inb" {
  default = {
    inb = {
      name                   = "inb"
      description            = "VRF Used for InBand Management"
      bd_enforced_enable     = "no"
      ip_data_plane_learning = "enabled"
      pc_enf_dir             = "ingress"
      pc_enf_pref            = "enforced"
    }
  }
}

variable "vlan_pools" {
  default = {
    INBAND_MGMT_VLANS = {
      desc       = "pool for project BRIDGE to be used by L3Outs"
      allocation = "static"
    }
  }
}
variable "vlan_ranges" {
  default = {
    1 = {
      vlan_pool  = "INBAND_MGMT_VLANS"
      start      = "8"
      end        = "9"
      allocation = "static"
    },
    2 = {
      vlan_pool  = "INBAND_MGMT_VLANS"
      start      = "500"
      end        = "500"
      allocation = "static"
    }


  }
}


# Domains
variable "domains" {
  default = {
    OTT-CORE-INBAND-VPC-L3OUT = {
      type      = "l3dom"
      vlan_pool = "INBAND_MGMT_VLANS"
    },
    OTT-CORE-INBAND-PHYSICAL = {
      type      = "phys"
      vlan_pool = "INBAND_MGMT_VLANS"
    }
  }
}
# Attachable Entity Profiles (AAEPs)
variable "aaeps" {
  default = {
    OTT-CORE-INBAND-VPC-AAEP = {
      domain = "OTT-CORE-INBAND-VPC-L3OUT"

    },
  }
}

# Bridge Domain
variable "bds" {
  default = {
    bd_inb = {
      name   = "inb"
      subnet = "10.0.9.0/24"
    },
  }
}

# Fabric nodes
variable "fabric_nodes" {
  default = {
    1 = {
      type    = "apic"
      node_id = "1"
    },
    103 = {
      type    = "leaf"
      node_id = "103"
    },
    104 = {
      type    = "leaf"
      node_id = "104"
    },
    201 = {
      type    = "spine"
      node_id = "201"
    },
  }
}