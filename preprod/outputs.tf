output "resource_groups" {
  description = "Created Resource Groups"
  value       = module.resource_group.resource_groups
}

output "virtual_networks" {
  description = "Created Virtual Networks"
  value       = module.virtual_network.vnets
}

output "subnets" {
  description = "Created Subnets"
  value       = module.virtual_network.subnets
}

output "storage_accounts" {
  description = "Created Storage Accounts"
  value       = module.storage_account.storage_accounts
}
