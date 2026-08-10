variable "resource_groups" {
  description = "Map of resource groups to create using for_each loop"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
  default = {
    "rg1" = {
      name     = "ojharg1"
      location = "eastus"
    }
  }
}
