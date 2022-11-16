output "vng" {
  value = azurerm_virtual_network_gateway.default
}

output "vnet" {
  value = azurerm_virtual_network.default
}

output "route_server" {
  value = azurerm_route_server.default
}
