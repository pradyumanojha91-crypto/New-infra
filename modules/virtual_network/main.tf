resource "azurerm_virtual_network" "this" {
  for_each = var.vnets

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = each.value.address_space

  tags = lookup(each.value, "tags", {})
}

locals {
  subnet_list = flatten([
    for vnet_key, vnet in var.vnets : [
      for snet_key, snet in lookup(vnet, "subnets", {}) : {
        key                  = "${vnet_key}-${snet_key}"
        name                 = snet_key
        resource_group_name  = vnet.resource_group_name
        virtual_network_name = azurerm_virtual_network.this[vnet_key].name
        address_prefixes     = snet.address_prefixes
      }
    ]
  ])
}

resource "azurerm_subnet" "subnets" {
  for_each = { for s in local.subnet_list : s.key => s }

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}
