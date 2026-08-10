variable "location" {
  description = "Default Azure Region"
  type        = string
  default     = "eastus"
}

variable "resource_groups" {
  description = "Map of Resource Groups"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
}

variable "storage_accounts" {
  description = "Map of Storage Accounts"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = optional(string, "Standard")
    account_replication_type = optional(string, "LRS")
    tags                     = optional(map(string), {})
  }))
}

variable "vnets" {
  description = "Map of Virtual Networks"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    subnets = optional(map(object({
      address_prefixes = list(string)
    })), {})
    tags = optional(map(string), {})
  }))
}
