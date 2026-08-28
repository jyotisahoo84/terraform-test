resource "azurerm_public_ip" "lb_pip" {
  for_each = var.load_balancer

  name                = each.value.public_ip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_lb" "lb" {
  for_each = var.load_balancer

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_name
    public_ip_address_id = azurerm_public_ip.lb_pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each        = var.load_balancer
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = "backend-pool"
}

resource "azurerm_network_interface_backend_address_pool_association" "vm2" {
  network_interface_id    = "/subscriptions/329f8580-e5e1-43d2-9d07-f54e5353bc5b/resourceGroups/rg-dev/providers/Microsoft.Network/networkInterfaces/nic-linux1"

  ip_configuration_name   = "ipconfig1"

  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool["lb1"].id
}

resource "azurerm_network_interface_backend_address_pool_association" "vm3" {
  network_interface_id    = "/subscriptions/329f8580-e5e1-43d2-9d07-f54e5353bc5b/resourceGroups/rg-dev/providers/Microsoft.Network/networkInterfaces/nic-linux2"

  ip_configuration_name   = "ipconfig1"

  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool["lb1"].id
}

resource "azurerm_lb_probe" "http_probe" {
  for_each        = var.load_balancer
  loadbalancer_id = azurerm_lb.lb[each.key].id

  name     = "http-probe"
  protocol = "Http"
  port     = 80
  request_path = "/"
}

resource "azurerm_lb_rule" "http_rule" {
  for_each = var.load_balancer

  loadbalancer_id                = azurerm_lb.lb[each.key].id
  name                           = "http-rule"
  protocol                       = "Tcp"

  frontend_port                  = 80
  backend_port                   = 80

  frontend_ip_configuration_name = each.value.frontend_ip_name

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.backend_pool[each.key].id
  ]

  probe_id = azurerm_lb_probe.http_probe[each.key].id
}