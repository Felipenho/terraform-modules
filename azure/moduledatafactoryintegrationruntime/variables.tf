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
variable data_factory {
  type = object({
    name = string
    resource_group_name = string
    id = string
  })
  description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory_integration_runtime_self_hosted#data_factory_id"
}

## Terraform
variable name {
    type = string
    description = "(Optional) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group#name"
    default = ""
}
variable location {
    description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#location-1"
    default     = "eastus"
}