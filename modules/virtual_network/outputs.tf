output "vnets" {
  description = "Map of created virtual networks"
  value       = { for k, v in azurerm_virtual_network.this : k => { id = v.id, name = v.name, address_space = v.address_space } }
}

output "subnets" {
  description = "Map of created subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => { id = v.id, name = v.name } }
}
