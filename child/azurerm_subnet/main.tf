resource "azurerm_subnet" "subnet" {
  for_each             = var.subnets
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.subnet_address_prefixes
}
