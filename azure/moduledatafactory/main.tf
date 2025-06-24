data "azurerm_client_config" "current" {}

provider "azurerm" {
  features {}
}

locals {
  tags = {
      empresa      = var.empresa
      environment  = var.ambiente
      object_id    = data.azurerm_client_config.current.object_id
  }
}

resource "azurerm_data_factory" "main" {
  name                        = var.name == "" ? lower(join("", [var.empresa,"df",var.ambiente])) : lower(join("", [var.empresa,var.name,var.ambiente]))
  location                    = var.location
  resource_group_name         = var.resource_group.name

  tags                = local.tags

  dynamic "vsts_configuration" {
    for_each = var.enable_vsts_configuration == true ? [1] : []
    content {
      account_name        = "ArbitersOfAsh"
      branch_name         = "main"
      project_name        = var.project_name
      repository_name     = var.repository_name
      root_folder         = "/"
      tenant_id           = data.azurerm_client_config.current.tenant_id
      publishing_enabled  = "true"
    }
  }

  dynamic "github_configuration" {
    for_each = var.enable_github_configuration == true ? [1] : []
    content {
      account_name        = "Felipenho"
      branch_name         = "main"
      git_url             = "https://github.com"
      repository_name     = var.repository_name
      root_folder         = "/"
      publishing_enabled  = "true"
    }
  }

  identity {
    type = "SystemAssigned"
  }
}