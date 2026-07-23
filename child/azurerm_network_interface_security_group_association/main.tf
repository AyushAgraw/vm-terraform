resource "azurerm_network_interface_security_group_association" "nic_nsg" {
    for_each = var.nsg_allocation
  network_interface_id      = data.azurerm_network_interface.NIC[each.key].id
  network_security_group_id = data.azurerm_network_security_group.NSG[each.key].id
}

data "azurerm_network_interface" "NIC" {
  for_each = var.nsg_allocation
  name = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_network_security_group" "NSG" {
  for_each = var.nsg_allocation
  name = each.value.nsg_name
  resource_group_name = each.value.rg_name
}