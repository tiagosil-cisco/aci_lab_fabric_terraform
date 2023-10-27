variable "credentials" {
  type = map(any)
  default = {
    aci = {
      username = "dovetail"
      password = "C!sco123"
      url      = "https://10.0.255.100"
    }

  }
}
