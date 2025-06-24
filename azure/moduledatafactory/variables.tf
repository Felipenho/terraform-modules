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
  default     = false
  description = "Ativa a configuração VSTS"

  validation {
    condition     = !var.enable_vsts_configuration || (var.repository_name != "" && var.project_name != "")
    error_message = "Se enable_vsts_configuration for true, as variáveis repository_name e project_name devem ser fornecidas!"
  }
}
variable enable_github_configuration {
  type        = bool
  default     = false
  description = "Ativa a configuração Github"

  validation {
    condition     = !var.enable_github_configuration || (var.repository_name != "" && var.account_name != "")
    error_message = "Se enable_github_configuration for true, as variáveis repository_name e account_name devem ser fornecidas!"
  }
}
variable account_name {
    type = string
    description = "(Optional) Nome da Conta do Github."
    default = "Felipenho"
}
variable project_name {
    type = string
    description = "(Optional) Nome do projeto do Azure DevOps, que pertence ao projeto."
    default = "Projects"
}
variable repository_name {
    type = string
    description = "(Optional) Nome do repositório do Azure DevOps ou Github."
    default = ""
}
variable "validate_configuration_mode" {
  description = "(Required) Validação para evitar que o bloco para repositório não conflita. Os dois não podem ser habilitados ao mesmo tempo."
  default     = true

  validation {
    condition     = !(var.enable_vsts_configuration && var.enable_github_configuration)
    error_message = "Apenas um dos blocos de configuração de repositório pode ser habilitado ao mesmo tempo. Habilite apenas um: enable_vsts_configuration ou enable_github_configuration."
  }
}
