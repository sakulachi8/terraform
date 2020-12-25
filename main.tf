provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "basic" {
  name     = var.resource_group
  location = var.rg_location
}