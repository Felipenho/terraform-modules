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
# variable enable_vsts_configuration {
#   type        = bool
#   default     = false
#   description = "Ativa a configuração VSTS"

#   validation {
#     condition     = !var.enable_vsts_configuration || (var.repository_name != "" && var.project_name != "")
#     error_message = "Se enable_vsts_configuration for true, as variáveis repository_name e project_name devem ser fornecidas!"
#   }
# }
# variable repository_name {
#     type = string
#     description = "(Optional) Nome do repositório do Azure DevOps, que pertence ao projeto."
#     default = ""
# }
# variable project_name {
#     type = string
#     description = "(Optional) Nome do repositório do Azure DevOps, que pertence ao projeto."
#     default = "Projects"
# }
variable "enable_vsts_configuration" {
  type        = bool
  default     = false
  description = "Ativa a configuração VSTS"

  validation {
    condition = (
      !var.enable_vsts_configuration ||
      (length(trimspace(var.repository_name)) > 0 && length(trimspace(var.project_name)) > 0)
    )
    error_message = "Se enable_vsts_configuration for true, 'repository_name' e 'project_name' não podem estar vazios!"
  }
}
variable "repository_name" {
  type        = string
  description = "(Optional) Nome do repositório do Azure DevOps, que pertence ao projeto."
  default     = ""
}
variable "project_name" {
  type        = string
  description = "(Optional) Nome do projeto do Azure DevOps. Padrão: 'Projects'."
  default     = "Projects"
}