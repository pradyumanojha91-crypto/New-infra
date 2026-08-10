output "resource_groups" {
  description = "Map of created resource groups"
  value       = { for k, v in azurerm_resource_group.this : k => { id = v.id, name = v.name, location = v.location } }
}
