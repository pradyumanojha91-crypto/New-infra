module "resource_group" {
  source = "../modules/resource_group"

  resource_groups = var.resource_groups
}

module "virtual_network" {
  source = "../modules/virtual_network"

  vnets      = var.vnets
  depends_on = [module.resource_group]
}

module "storage_account" {
  source = "../modules/storage_account"

  storage_accounts = var.storage_accounts
  depends_on       = [module.resource_group]
}
