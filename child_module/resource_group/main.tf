resource "azurerm_resource_group" "res_grp" {

    for_each = var.rgs

    name = each.value.name
    location = each.value.location
  
}