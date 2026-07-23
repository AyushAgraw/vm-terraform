module "resource_group" {
  source = "../../child/azurerm_resource_group"
  rgs    = var.RGS
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../child/azurerm_virtual_network"
  vnets      = var.VNETS
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../child/azurerm_subnet"
  subnets    = var.SUBNETS
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../child/azurerm_public_ip"
  pip        = var.PIPS
}

module "nic" {
  depends_on = [module.public_ip, module.subnet]
  source     = "../../child/azurerm_network_interface"
  nics       = var.NICS
}

module "VM" {
  depends_on = [module.nic]
  source     = "../../child/azurerm_linux_virtual_machine"
  vms        = var.VMS
}

module "NSG" {
  depends_on = [ module.resource_group ]
  source = "../../child/azurerm_network_security_group"
  nsgs = var.NSGS
}

module "NSG_rule" {
  depends_on = [ module.NSG ]
  source = "../../child/azurerm_network_security_rule"
  nsg_rules = var.NSG_RULES
}

module "NSG_association" {
  depends_on = [ module.nic,module.NSG ]
  source = "../../child/azurerm_network_interface_security_group_association"
  nsg_allocation = var.NSG_ALLOCATION
}
