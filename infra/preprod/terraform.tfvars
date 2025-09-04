# value of resource group variable
dev_rg = {
  "dev_rg" = {
    name     = "bilalcorp-rg"
    location = "australia east"
  }
}

# value of storage account variable
dev_stg = {
  "dev_stg" = {
    name     = "bilalcorpstg7744"
    location = "australia east"
    r_g_n    = "bilalcorp-rg"
    a_r_t    = "LRS"
    a_t      = "Standard"
  }
}

# value of virtual network variable
dev_vnet = {
  "dev_vnet" = {
    name     = "bilalcorp-vnet"
    location = "australiaeast"
    r_g_n    = "bilalcorp-rg"
    a_s      = ["10.0.0.0/16"]
  }
}

# value of front subnet variable
dev_frontsubnet = {
  "dev_frontsubnet" = {
    name  = "bilalcorp-frontsubnet"
    r_g_n = "bilalcorp-rg"
    v_n_n = "bilalcorp-vnet"
    a_p   = ["10.0.1.0/24"]
  }
}

# value of back subnet variable
dev_backsubnet = {
  "dev_backsubnet" = {
    name  = "bilalcorp-backsubnet"
    r_g_n = "bilalcorp-rg"
    v_n_n = "bilalcorp-vnet"
    a_p   = ["10.0.2.0/24"]
  }
}

# value of bastion subnet variable
dev_bastionsubnet = {
  "dev_bastionsubnet" = {
    name  = "AzureBastionSubnet"
    r_g_n = "bilalcorp-rg"
    v_n_n = "bilalcorp-vnet"
    a_p   = ["10.0.0.0/24"]
  }
}

# value of network interface card front variables
dev_frontnic = {
  "frontnic" = {
    name     = "frontnic"
    location = "australiaeast"
    r_g_n    = "bilalcorp-rg"
    ip_name  = "frontinternal"
    subnetid = "bilalcorp-frontsubnet"
    p_i_a_a  = "Dynamic"
  }
}
dev_data_frontsubnet = {
  "bilalcorp-frontsubnet" = {
    v_n_n = "bilalcorp-vnet"
    r_g_n = "bilalcorp-rg"
  }
}

# value of network interface card back variables
dev_backnic = {
  "backnic" = {
    name     = "backnic"
    location = "australiaeast"
    r_g_n    = "bilalcorp-rg"
    ip_name  = "backinternal"
    subnetid = "bilalcorp-backsubnet"
    p_i_a_a  = "Dynamic"
  }
}

dev_data_backsubnet = {
  "bilalcorp-backsubnet" = {
    v_n_n = "bilalcorp-vnet"
    r_g_n = "bilalcorp-rg"
  }
}

# value of bastion variable
dev_bastionhost = {
  "bastionhost" = {
    name     = "bastionhost"
    location = "australiaeast"
    r_g_n    = "bilalcorp-rg"
    ip_name  = "bastionconfiguration"
    subnetid = "AzureBastionSubnet"
    pipid    = "bilalcorp-pip"
  }
}

dev_bastionhost_data_pip = {
  "bilalcorp-pip" = "bilalcorp-rg"
}

dev_bastionhost_subnet = {
  "AzureBastionSubnet" = {
    v_n_n = "bilalcorp-vnet"
    r_g_n = "bilalcorp-rg"
  }
}

# value of public ip variable
dev_pip = {
  "bilalcorp-pip" = {
    name     = "bilalcorp-pip"
    r_g_n    = "bilalcorp-rg"
    location = "australiaeast"
    a_m      = "Static"
  }
}





# value of keyvault variable
dev_keyvault = {
  "dev_keyvault" = {
    name     = "keyvaultbatch17g18"
    location = "australiaeast"
    r_g_n    = "bilalcorp-rg"
    e_f_d_e  = true
    s_d_r_d  = 7
    p_p_e    = false
    s_n      = "standard"
    r_a_e    = true
    r_d_n    = "Key Vault Administrator"
  }
}

# value of keyvault secret variable
dev_keyvaultsecret = {
  "bilalcorp-frontvmusername" = {
    value = "used"
    k_v_i = "keyvaultbatch17g18"
  }

  "bilalcorp-backvmusername" = {
    value = "used"
    k_v_i = "keyvaultbatch17g18"
  }

  "sqlusername" = {
    value = "used"
    k_v_i = "keyvaultbatch17g18"
  }

  "bilalcorp-frontvmpassword" = {
    value = "Smartuser123#"
    k_v_i = "keyvaultbatch17g18"
  }

  "bilalcorp-backvmpassword" = {
    value = "Smartuser123#"
    k_v_i = "keyvaultbatch17g18"
  }

  "sqlpassword" = {
    value = "Smartuser123#"
    k_v_i = "keyvaultbatch17g18"
  }

}

dev_keyvaultid = {
  "keyvaultbatch17g18" = {
    name  = "keyvaultbatch17g18"
    r_g_n = "bilalcorp-rg"
  }
}

# value of virtual machine variable
dev_frontvm = {
  "frontnic" = {
    name      = "bilalcorp-frontvm"
    r_g_n     = "bilalcorp-rg"
    location  = "australiaeast"
    size      = "Standard_F2"
    caching   = "ReadWrite"
    s_a_t     = "Standard_LRS"
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    d_p_a=false
  }
}

# value of virtual machine bastion variable
dev_backvm = {
  "backnic" = {
    name      = "bilalcorp-backvm"
    r_g_n     = "bilalcorp-rg"
    location  = "australiaeast"
    size      = "Standard_F2"
    caching   = "ReadWrite"
    s_a_t     = "Standard_LRS"
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    d_p_a=false
  }
}

