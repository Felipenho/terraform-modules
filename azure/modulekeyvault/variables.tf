## Tags
variable empresa {
  type        = string
  description = "(Required) Empresa onde estará o contexto"
}
variable ambiente {
  type        = string
  description = "(Required) Tipo de ambiente que está sendo criado (e.g dev, tst, hmg ou prd)"
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
variable key_vault_sku_name {
    description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#sku_name"
    default = "standard"
}