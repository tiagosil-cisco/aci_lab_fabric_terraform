resource "aci_rest_managed" "systemAliasBanner" {
  dn         = "uni/userext/preloginbanner"
  class_name = "aaaPreLoginBanner"
  content = {
    guiTextMessage = var.system_alias_banner.alias
    message        = var.system_alias_banner.apic_banner
    switchMessage  = var.system_alias_banner.switch_banner
  }
}