variable "credentials" {}
variable "project_name" {}

# Leafs
variable "leafs" {
  default = {
    "103" = {
      name = "leaf-103"
      from = "103"
      to   = "103"
    },
    "104" = {
      name = "leaf-104"
      from = "104"
      to   = "104"
    },
    "103-104" = {
      name = "leaf-103-104"
      from = "103"
      to   = "104"
    }
  }
}



# Link level policies
variable "intpols" {
  default = {
    link-100M = {
      desc         = "100Mbps"
      speed        = "100M"
      linkdebounce = "100"
      fec          = "inherit"
      autoneg      = "on"
    },
    link-1G = {
      desc         = "1Gbps"
      speed        = "1G"
      linkdebounce = "100"
      fec          = "inherit"
      autoneg      = "on"
    },
    link-10G = {
      desc         = "10Gbps"
      speed        = "10G"
      linkdebounce = "100"
      fec          = "inherit"
      autoneg      = "on"
    },
    link-25G = {
      desc         = "25Gbps - use with short-length passive cables"
      speed        = "25G"
      linkdebounce = "100"
      fec          = "inherit"
      autoneg      = "on"
    },
    link-25G-FEC-CL74-FC = {
      desc         = "25Gbps - use with 3-meter passive cable and 1 to 10-meter active cables"
      speed        = "25G"
      linkdebounce = "100"
      fec          = "cl74-fc-fec"
      autoneg      = "on"
    },
    link-25G-FEC-CL91-RC = {
      desc         = "25Gbps - use with 5-meter passive cable and 100-meter SPF-25G-SR or SPF-25G-LR"
      speed        = "25G"
      linkdebounce = "100"
      fec          = "cl91-rs-fec"
      autoneg      = "on"
    },
    link-40G = {
      desc         = "40Gbps"
      speed        = "40G"
      linkdebounce = "100"
      fec          = "inherit"
      autoneg      = "on"
    },
    link-100G = {
      desc         = "100Gbps"
      speed        = "100G"
      linkdebounce = "100"
      fec          = "inherit"
      autoneg      = "on"
    }
  }
}

# LLDP policies
variable "lldp" {
  default = {
    lldp_enabled = {
      desc     = "lldp TX and RX on"
      receive  = "enabled"
      transmit = "enabled"
    },
    lldp_disabled = {
      desc     = "lldp TX and RX off"
      receive  = "disabled"
      transmit = "disabled"
    }
  }
}

# CDP policies
variable "cdp" {
  default = {
    cdp_enabled = {
      desc        = "cdp enabled"
      admin_state = "enabled"
    },
    cdp_disabled = {
      desc        = "cdp disabled"
      admin_state = "disabled"
    }
  }
}

# MCP policies
variable "mcp" {
  default = {
    mcp_enabled = {
      desc        = "mcp enabled"
      admin_state = "enabled"
    },
    mcp_disabled = {
      desc        = "mcp disabled"
      admin_state = "disabled"
    }
  }
}

# LACP policies
variable "lacp" {
  default = {
    lacp_active = {
      min_links = "1"
      max_links = "16"
      mode      = "active"
    }
  }
}

variable "vlan_pools" {
  default = {
    BRIDGE_L3OUTS = {
      desc       = "pool for project BRIDGE to be used by L3Outs"
      allocation = "static"
    },
    OTT-CORE-MAIN-VPC = {
      desc       = "pool for project BRIDGE to be used by L3Outs"
      allocation = "static"
    },

  }
}
variable "vlan_ranges" {
  default = {

    12 = {
      vlan_pool  = "OTT-CORE-MAIN-VPC"
      start      = "1600"
      end        = "1600"
      allocation = "static"
    },
    13 = {
      vlan_pool  = "OTT-CORE-MAIN-VPC"
      start      = "1601"
      end        = "1601"
      allocation = "static"
    },
    14 = {
      vlan_pool  = "OTT-CORE-MAIN-VPC"
      start      = "8"
      end        = "8"
      allocation = "static"
    },


  }
}

# Domains
variable "domains" {
  default = {
    OTT-CORE-MAIN-VPC-L3OUT = {
      type      = "l3dom"
      vlan_pool = "OTT-CORE-MAIN-VPC"
    },
    /*
    BRATTICE-FI-PHYSICAL = {
      type = "phys"
    },
    */
  }
}

# Attachable Entity Profiles (AAEPs)
variable "aaeps" {
  default = {
    OTT-CORE-MAIN-VPC-AAEP = {
      name   = "OTT-CORE-MAIN-VPC-AAEP"
      domain = "OTT-CORE-MAIN-VPC-L3OUT"
    }
  }
}


# Leaf VPC Port Policy Groups
variable "leafs_vppg" {
  default = {
    VPC_to_OTT-CORE = {
      lldp         = "lldp_enabled"
      cdp          = "cdp_enabled"
      channel_mode = "lacp_active"
      aaep         = "OTT-CORE-MAIN-VPC-AAEP"
      desc         = "External N9K VPC to OTT-CORE"
    }
  }
}

# Interfaces
variable "interfaces" {
  default = {
    "leaf_103_eth_1_10" = {
      leaf   = "103"
      iftype = "vpc"
      lfblk  = "1"
      from   = "10"
      end    = "10"
      polgrp = "VPC_to_OTT-CORE"
    },
    "leaf_104_eth_1_10" = {
      leaf   = "104"
      iftype = "vpc"
      lfblk  = "1"
      from   = "10"
      end    = "10"
      polgrp = "VPC_to_OTT-CORE"
    },
  }
}