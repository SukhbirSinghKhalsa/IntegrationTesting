variable "resource_group_reference" {
  type = map
  default = {
    rg1 = {
      resource_group_name = "ssk-inc-sandbox-rg"
      location            = "centralindia"
      tags = {
        env = "sandbox"
      }
    }
  }
}
