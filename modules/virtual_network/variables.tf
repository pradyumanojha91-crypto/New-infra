variable "vnets" {
  description = "Map of virtual networks to create using for_each loop"
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
  default = {}
}
