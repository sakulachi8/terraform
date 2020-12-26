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


resource "azurerm_virtual_network" "basic" {
  name                = azurerm_resource_group.basic.name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.basic.location
  resource_group_name = azurerm_resource_group.basic.name
}

resource "azurerm_subnet" "basic" {
  name                 = azurerm_resource_group.basic.name
  resource_group_name  = azurerm_resource_group.basic.name
  virtual_network_name = azurerm_virtual_network.basic.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "basic" {
  name                = azurerm_resource_group.basic.name
  location            = azurerm_resource_group.basic.location
  resource_group_name = azurerm_resource_group.basic.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.basic.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "basic" {
  name                = var.machine_name
  resource_group_name = azurerm_resource_group.basic.name
  location            = azurerm_resource_group.basic.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.basic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}