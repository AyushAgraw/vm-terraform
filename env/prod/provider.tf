terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "netflix-rg123456"
    storage_account_name = "netflixstg4567"
    container_name       = "backendcontainer"
    key                  = "netflix-backend.tfstate"
  }
}

provider "azurerm" {
  features {}
}
