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

resource "azurerm_storage_account" "example" {
  name                          = var.name == "" ? upper(join("_", [var.empresa,"RG",var.ambiente])) : upper(join("_", [var.empresa,var.name,var.ambiente]))
  resource_group_name           = azurerm_resource_group.example.name
  location                      = azurerm_resource_group.example.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  min_tls_version               = "TLS1_2"
  public_network_access_enabled = true
  tags      = local.tags
}

resource "azurerm_management_lock" "main" {
  count      = var.lock ? 1 : 0

  name       = lower(join("", [azurerm_storage_account.main.name, "lock"]))
  scope      = azurerm_storage_account.main.id
  lock_level = "CanNotDelete"
}

