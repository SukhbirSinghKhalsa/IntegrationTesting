resource "azurerm_resource_group" "resource_group" {
  for_each = var.resource_group_reference
  name     = each.value.resource_group_name
  location = each.value.location
  tags     = each.value.tags
}