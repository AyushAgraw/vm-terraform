resource "azurerm_network_security_rule" "name" {
  for_each = var.nsg_rules
   name                        = each.value.nsg_rule_name
  priority                    = each.value.nsg_rule_priority
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = each.value.rg_name
  network_security_group_name = each.value.nsg_name
}