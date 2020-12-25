provider "azurerm" {
  features {}

  subscription_id = "5c4b1a1c-000e-4f7a-91a5-6776165fd1dd"
  client_id       = "8cf0fa37-6205-43f7-b06b-3cfb59026540"
  client_secret   = var.client_secret
  tenant_id       = "1749fb38-fafd-46ef-bfa9-c593ae55e03f"
}

resource "azurerm_resource_group" "basic" {
  name     = var.resource_group
  location = var.rg_location
}