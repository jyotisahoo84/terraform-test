resource "azurerm_bastion_host" "bastion-host" {

    for_each = var.bastion

    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location

    ip_configuration {
        name = each.value.ipc
        subnet_id = each.value.sid
        public_ip_address_id = each.value.pipid
    }
  
}