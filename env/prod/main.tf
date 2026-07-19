module "resource_group" {
  source = "../../child/azurerm_resource_group"
  rgs    = var.RGS
}

module "virtual_network" {
  depends_on = [ module.resource_group ]
  source = "../../child/azurerm_virtual_network"
  vnets = var.VNETS
}

module "subnet" {
  depends_on = [ module.virtual_network ]
  source = "../../child/azurerm_subnet"
  subnets = var.SUBNETS
}