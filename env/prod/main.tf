module "resource_group" {
  source = "../../child/azurerm_resource_group"
  rgs = var.RGS
}

