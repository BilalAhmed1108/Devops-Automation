# variable for resource group
variable "dev_rg" {}

# variable for storage acccount
variable "dev_stg" {}

# variable virtual network
variable "dev_vnet" {}

# variable for frontsubnet
variable "dev_frontsubnet" {}

# variable for backsubnet
variable "dev_backsubnet" {}

# variable for bastion subnet
variable "dev_bastionsubnet" {}

# variable for frontnic
variable "dev_frontnic" {}
variable "dev_data_frontsubnet" {}

# variable for backnic
variable "dev_backnic" {}
variable "dev_data_backsubnet" {}

# variable for bastion
variable "dev_bastionhost" {}
variable "dev_bastionhost_data_pip" {}
variable "dev_bastionhost_subnet" {}

# variable for public ip
variable "dev_pip" {}



# variable for keyvault
variable "dev_keyvault" {}

# variable for keyvault secret
variable "dev_keyvaultsecret" {}
variable "dev_keyvaultid" {}

#variable for virtual machine
variable "dev_frontvm" {}

#variable for virtual machine bastion
variable "dev_backvm" {}



