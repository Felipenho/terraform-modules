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

resource "azurerm_key_vault" "main" {
  name                = var.name == "" ? lower(join("", [var.empresa,"df",var.ambiente])) : lower(join("", [var.empresa,var.name,var.ambiente]))
  location            = var.location
  resource_group_name = var.resource_group.name
  sku_name            = var.key_vault_sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  tags                = local.tags
}

resource "azurerm_management_lock" "main" {
  name       = lower(join("", [azurerm_key_vault.main.name, "lock"]))
  scope      = azurerm_key_vault.main.id
  lock_level = "CanNotDelete"
}