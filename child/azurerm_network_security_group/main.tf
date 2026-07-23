resource "azurerm_network_security_group" "NSG" {
  for_each            = var.nsgs
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
}

