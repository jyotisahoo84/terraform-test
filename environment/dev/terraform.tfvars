rgs = {
  rg1 = {
    name     = "rg-dev1"
    location = "centralindia"
  }

  rg2 = {
    name     = "rg-prod"
    location = "centralindia"
  }
}


vnets = {
  vnet1 = {
    name                = "vnet-dev"
    resource_group_name = "rg-dev1"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
  }
}


snets = {
  snet1 = {
    name                 = "snet-dev"
    resource_group_name  = "rg-dev1"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.1.0/24"]
  }

  bastion-subnet = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-dev1"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.6.0/26"]
  }
}

pip = {

  bastion-pip = {

    name                = "pip-bastion"
    resource_group_name = "rg-dev1"
    location            = "centralindia"

    allocation_method = "Static"
    sku               = "Standard"
  }
}
