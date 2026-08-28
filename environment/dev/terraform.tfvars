rgs = {
    rg1 = {
        name = "rg-dev"
        location = "centralindia"
    }

    rg2 = {
        name = "rg-prod"
        location = "centralindia"
    }
}


vnets = {
    vnet1 = {
        name = "vnet-dev"
        resource_group_name = "rg-dev"
        location = "centralindia"
        address_space = ["10.0.0.0/16"]
    }
}


snets = {
    snet1 = {
        name = "snet-dev"
        resource_group_name = "rg-dev"
        virtual_network_name = "vnet-dev"
        address_prefixes = ["10.0.1.0/24"]
    }

    bastion-subnet = {
    name = "AzureBastionSubnet"
    resource_group_name   = "rg-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes  = ["10.0.6.0/26"]
  }
}

pip = {

    bastion-pip = {

        name = "pip-bastion"
        resource_group_name = "rg-dev"
        location = "centralindia"

        allocation_method = "Static"
        sku = "Standard"
    }
}

network_int = {
    linux1 = {

        name = "nic-linux1"
        resource_group_name = "rg-dev"
        location = "centralindia"

        ipc = "ipconfig1"
        pvt = "Dynamic"
    }

    linux2 = {

        name = "nic-linux2"
        resource_group_name = "rg-dev"
        location = "centralindia"

        ipc = "ipconfig1"
        pvt = "Dynamic"
    }
}

network_sec = {

    linux1 = {
        name ="nsg-linux1"
        resource_group_name = "rg-dev"
        location = "centralindia"
    }

    linux2 = {
        name ="nsg-linux2"
        resource_group_name = "rg-dev"
        location = "centralindia"
    }

}

bastion = {

    bastion-host = {

        name = "bastion-host"
        resource_group_name   = "rg-dev"
        location = "centralindia"

        ipc = "bastion-ip-config"

        sid = "/subscriptions/329f8580-e5e1-43d2-9d07-f54e5353bc5b/resourceGroups/rg-dev/providers/Microsoft.Network/virtualNetworks/vnet-dev/subnets/AzureBastionSubnet"

        pipid = "/subscriptions/329f8580-e5e1-43d2-9d07-f54e5353bc5b/resourceGroups/rg-dev/providers/Microsoft.Network/publicIPAddresses/pip-bastion"
    }
}

linux_vm1 = {

    linux_vm2 = {

        name = "vm-linux2"
        resource_group_name = "rg-dev"
        location = "centralindia"

        size = "Standard_D2s_v3"

        hostname = "linux-computer"
        user = "testadmin"
        password = "Password1234!"
        nicid = "/subscriptions/329f8580-e5e1-43d2-9d07-f54e5353bc5b/resourceGroups/rg-dev/providers/Microsoft.Network/networkInterfaces/nic-linux1"
        os_disk = "frontend-linux1-osdisk"
    }

    linux_vm3 = {

        name = "vm-linux3"
        resource_group_name = "rg-dev"
        location = "centralindia"

        size = "Standard_D2s_v3"

        hostname = "linux-computer"
        user = "testadmin"
        password = "Password1234!"
        nicid = "/subscriptions/329f8580-e5e1-43d2-9d07-f54e5353bc5b/resourceGroups/rg-dev/providers/Microsoft.Network/networkInterfaces/nic-linux2"
        os_disk = "frontend-linux3-osdisk"
    }
}

load_balancer = {
  lb1 = {
    name                = "lb-dev"
    location            = "centralindia"
    resource_group_name = "rg-dev"
    public_ip_name      = "lb-public-ip"
    frontend_ip_name    = "lb-frontend"
  }
}

