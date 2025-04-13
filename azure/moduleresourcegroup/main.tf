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

resource "azurerm_resource_group" "main" {
  name      = var.name == "" ? upper(join("_", [var.empresa,"RG",var.ambiente])) : upper(join("_", [var.empresa,var.name,var.ambiente]))
  location  = var.location
  tags      = local.tags
}

resource "azurerm_management_lock" "main" {
  count = var.lock ? 1 : 0

  name       = lower(join("", [azurerm_resource_group.main.name, "lock"]))
  scope      = azurerm_resource_group.main.id
  lock_level = "CanNotDelete"
}