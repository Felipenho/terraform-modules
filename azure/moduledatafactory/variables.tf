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
variable name {
    type        = string
    description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#name-1"
}
variable location {
    description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#location-1"
    default     = "eastus"
}
variable enable_vsts_configuration {
  type        = bool
  description = "(Optional) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#enable_vsts_configuration-1"
  default     = true
}
# variable "account_name" {
#   type        = string
#   description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#account_name-1"
# }
# variable "branch_name" {
#   type        = string
#   description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#branch_name-1"
# }
# variable "project_name" {
#   type        = string
#   description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#project_name-1"
# }
# variable "repository_name" {
#   type        = string
#   description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#repository_name-1"
# }
# variable "root_folder" {
#   type        = string
#   description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#root_folder-1"
# }
# variable "tenant_id" {
#   type        = string
#   description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#tenant_id-1"
# }
# variable "publishing_enabled" {
#   type        = string
#   description = "(Required) https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#publishing_enabled-1"
#   default     = "true"
# }
