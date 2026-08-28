output "nic_ids" {
  value = {
    for key, nic in azurerm_network_interface.nics :
    key => nic.id
  }
}