resource "aci_rest_managed" "dateTime" {
  dn         = "uni/fabric/format-default"
  class_name = "datetimeFormat"
  content = {
    displayFormat = var.date_time.format
    tz            = var.date_time.timezone
    showOffset    = var.date_time.offset
  }
}