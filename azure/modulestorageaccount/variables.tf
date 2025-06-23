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
    description = "(Optional) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#name"
    default = ""
}
variable location {
    description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#location-1"
    default     = "eastus"
}
variable account_kind {
  type        = string
  default     = "StorageV2"
  description = "(Optional) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#account_kind"
}
variable account_tier {
  type    = string
  default = "Standard"
  description = "(Optional) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#account_tier"
}
variable account_replication_type {
  type    = string
  default = "LRS"
  description = "(Optional) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#account_replication_type"
}
variable lock {
    type = bool
    description = "(Optional) Se proíbe exclusão manual do recurso."
    default = false
}