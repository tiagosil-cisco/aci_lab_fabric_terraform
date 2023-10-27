locals {
  mgmt_epg = "inb-InBand_EPG"
}

variable "credentials" {}
variable "project_name" {}

variable "apic_conn_pref" {
  default = {
    apic_conn_pref = "inband"
  }
}

variable "system_alias_banner" {
  default = {
    alias         = "ACI-Fabric OTT02"
    apic_banner   = "ACI-Fabric OTT02 - Deployed using ACI"
    switch_banner = "ACI-Fabric OTT02 - You are logging into a switch that belongs to a Terraform-automated ACI fabric"
  }
}

variable "control_plane_mtu" {
  default = {
    control_plane_mtu = "9000"
  }
}

variable "date_time" {
  default = {
    format   = "local"
    timezone = "n240_America-Toronto"
    offset   = "enabled"
  }
}

variable "pod_policies" {
  default = {
    date_time = {
      name         = "default"
      admin_state  = "enabled"
      server_state = "enabled"
      auth_state   = "enabled"
      ntp1 = {
        name        = "10.0.0.252"
        description = "NTP Pool"
        preferred   = "yes"
        min_poll    = "4"
        max_poll    = "6"
        //mgmt_epg    = "inb-InBand_EPG"
      }
      ntp2 = {
        name        = "10.0.0.253"
        description = "NTP Pool"
        preferred   = "no"
        min_poll    = "4"
        max_poll    = "6"
        //mgmt_epg    = "inb-InBand_EPG"
      }
    }
  }
}

variable "global_dns_policy" {
  default = {
    dns = {
      name = "default"
      //management = "oob-default"
      domain = {
        name    = "mgmt.dovetail-lab.ca"
        default = "yes"
      }
      provider1 = {
        addr      = "10.0.10.22"
        preferred = "yes"
      }
      provider2 = {
        addr      = "10.0.10.23"
        preferred = "no"
      }
    }
  }
}

variable "pod_policy_group" {
  default = {
    name              = "default"
    date_time         = "default"
    isis              = "default"
    coop              = "default"
    bgp_rr            = "default"
    management_access = "default"
    snmp              = "default"
    macsec            = "default"
  }
}

variable "pod_profile" {
  default = {
    name = "default"
    selector = {
      name             = "default"
      type             = "ALL"
      pod_policy_group = "default"
    }
  }
}