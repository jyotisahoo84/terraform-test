resource "azurerm_network_interface" "nics" {

    for_each = var.network_int

    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    ip_configuration {
    name                          = each.value.ipc
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = each.value.pvt
  }
  
}