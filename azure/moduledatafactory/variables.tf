## Tags
variable empresa {
  type        = string
  description = "(Required) Empresa onde estará o contexto"
}
variable ambiente {
  type        = string
  description = "(Required) Tipo de ambiente que está sendo criado (e.g dev, tst, hmg ou prd)"
}

## Dependências
variable resource_group {
  type = object({
    name = string
  })
  description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#resource_group_name-1"
}
## Terraform
variable datafactory_name {
    type        = string
    description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#name-1"
}
variable location {
    description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#location-1"
    default     = "eastus"
}