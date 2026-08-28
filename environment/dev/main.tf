module "resg1" {

    source = "../../child_module/resource_group"
    rgs = var.rgs
  
}

module "virnet1" {

    depends_on = [ module.resg1 ]
    source = "../../child_module/vnet"
    vnets = var.vnets
  
}

module "subnet12" {

    depends_on = [ module.virnet1 ]
    source = "../../child_module/subnet"
    snets = var.snets
  
}

module "pip" {

    depends_on = [ module.resg1 ]
    source = "../../child_module/public_ip"
    pip = var.pip
  
}

module "networkinterface" {

    depends_on = [ module.resg1 ]
    source = "../../child_module/Network_Interface"
    network_int = var.network_int
    subnet_id = module.subnet12.subnet_id
  
}

module "net_sec_group" {

    depends_on = [ module.resg1 ]
    source = "../../child_module/Network_security"
    network_sec = var.network_sec
  
}

module "nic_nsg_association" {

  source = "../../child_module/NSG_NIC_Association"

  depends_on = [
    module.networkinterface,
    module.net_sec_group
  ]

  nic_ids = module.networkinterface.nic_ids
  nsg_ids = module.net_sec_group.nsg_ids

}

module "bastion_test" {

    depends_on = [ module.resg1, module.subnet12, module.pip ]
    source = "../../child_module/bastion"
    bastion = var.bastion
  
}

module "linuxvm" {

    depends_on = [ module.resg1, module.networkinterface ]
    source = "../../child_module/linux-VM1"
    linux_vm1 = var.linux_vm1
  
}

module "loadbalancer" {

    depends_on = [ module.resg1 ]
    source = "../../child_module/loadbalancer"
    load_balancer = var.load_balancer
  
}