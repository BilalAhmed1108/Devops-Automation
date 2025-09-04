# module for resource group
module "azurerm_resource_group" {
  source      = "../../Child/azurerm_resource_group"
  rg_variable = var.dev_rg
}

# module for storage account
module "azurerm_storage_account" {
  source       = "../../Child/azurerm_storage_account"
  depends_on   = [module.azurerm_resource_group]
  stg_variable = var.dev_stg
}

# module for virtual network
module "azurerm_virtual_network" {
  depends_on    = [module.azurerm_resource_group, module.azurerm_storage_account]
  source        = "../../Child/azurerm_virtual_network"
  vnet_variable = var.dev_vnet
}

# module for front subnet
module "azurerm_frontsubnet" {
  source     = "../../Child/azurerm_subnet"
  depends_on = [module.azurerm_virtual_network]
  subnet     = var.dev_frontsubnet
}

# module for back open subnet
module "azurerm_backsubnet" {
  source     = "../../Child/azurerm_subnet"
  depends_on = [module.azurerm_virtual_network]
  subnet     = var.dev_backsubnet
}

# module for bastion subnet
module "azurerm_bastionsubnet" {
  source     = "../../Child/azurerm_subnet"
  depends_on = [module.azurerm_virtual_network]
  subnet     = var.dev_bastionsubnet
}

# module for network interface card front
module "azurerm_network_interface_card_front" {
  depends_on = [module.azurerm_frontsubnet]
  source     = "../../Child/azurerm_network_interface_card"
  nic        = var.dev_frontnic
  subnet     = var.dev_data_frontsubnet
}

# module for network interface card back
module "azurerm_network_interface_card_back" {
  depends_on = [module.azurerm_backsubnet]
  source     = "../../Child/azurerm_network_interface_card"
  nic        = var.dev_backnic
  subnet     = var.dev_data_backsubnet
}

# module for bastion
module "azurerm_bastion" {
  source      = "../../Child/azurerm_bastion"
  depends_on  = [module.azurerm_virtual_network,module.azurerm_public_ip]
  pip         = var.dev_bastionhost_data_pip
  subnet      = var.dev_bastionhost_subnet
  bastionhost = var.dev_bastionhost

}

# module for public ip
module "azurerm_public_ip" {
  source     = "../../Child/azurerm_public_ip"
  depends_on = [module.azurerm_virtual_network]
  pip        = var.dev_pip
}


# module for keyvault
module "azurerm_keyvault" {
  depends_on = [ module.azurerm_resource_group ]
  source   = "../../Child/azurerm_keyvault"
  keyvault = var.dev_keyvault
}

# module for keyvault secret
module "azurerm_keyvault_secret" {
  source         = "../../Child/azurerm_keyvault_secret"
  depends_on     = [module.azurerm_keyvault]
  keyvaultsecret = var.dev_keyvaultsecret
  keyvaultid     = var.dev_keyvaultid
}

# module for virtual machine front
module "azurerm_virtual_machine_front" {
  source = "../../Child/azurerm_virtual_machine"
  depends_on = [ module.azurerm_keyvault_secret, module.azurerm_frontsubnet ]
  vm=var.dev_frontvm
  keyvaultid = var.dev_keyvaultid
  keyvaultsecret = var.dev_keyvaultsecret
  nicdata = var.dev_frontnic
}

# module for virtual machine back
module "azurerm_virtual_machine_back" {
  source = "../../Child/azurerm_virtual_machine"
  depends_on = [ module.azurerm_keyvault_secret , module.azurerm_backsubnet]
  vm=var.dev_backvm
  keyvaultid = var.dev_keyvaultid
  keyvaultsecret = var.dev_keyvaultsecret
  nicdata = var.dev_backnic
}

