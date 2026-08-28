resource "azurerm_linux_virtual_machine" "linux-vm" {

    for_each = var.linux_vm1

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size

  computer_name                   = each.value.hostname
  admin_username                  = each.value.user
  admin_password                  = each.value.password
  disable_password_authentication = false
  network_interface_ids = [
    each.value.nicid
  ]

  os_disk {
    name                 = each.value.os_disk
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"

  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  
}
}