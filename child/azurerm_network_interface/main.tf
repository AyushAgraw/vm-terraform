resource "azurerm_network_interface" "NIC" {
  for_each            = var.nics
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  ip_configuration {
    name                          = each.value.ip_configuration_name
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
  }
}


data "azurerm_subnet" "subnet" {
  for_each             = var.nics
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
}

data "azurerm_public_ip" "pip" {
  for_each            = var.nics
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
