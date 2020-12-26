##############################################################################
# Variables File
# 
# Here is where we store the default values for all the variables used in our
# Terraform code. If you create a variable with no default, the user will be
# prompted to enter it (or define it via config file or command line flags.)

variable "resource_group" {
  description = "The name of your Azure Resource Group."
  default     = "vm-creation-random"
}


variable "rg_location" {
  description = "The region of RG"
  default     = "centralus"
}

variable "client_secret" {
  description = "The name of your Azure Resource Group."
}


variable "machine_name" {
  description = "The name of your Azure Resource Group."
  default     = "dev-creation-random"
}

variable "virtual_network_name" {
  description = "The name for your virtual network."
  default     = "vnet"
}

variable "storage_account_type" {
  description = "Defines the storage tier. Valid options are Standard and Premium."
  default     = "Standard_LRS"
}


variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_A0"
}

variable "admin_username" {
  description = "Administrator user name"
  default     = "adminuser"
}

variable "admin_password" {
  description = "Administrator password"
  default     = "Adminpassword123!"
}