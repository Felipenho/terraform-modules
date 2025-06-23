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

resource "azurerm_storage_account" "main" {
  name                          = var.name == "" ? lower(join("", [var.empresa,"stg",var.ambiente])) : lower(join("", [var.empresa,var.name,var.ambiente]))
  resource_group_name           = var.resource_group.name
  location                      = var.location
  https_traffic_only_enabled    = true
  access_tier                   = "Cool"
  account_kind                  = var.account_kind
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  min_tls_version               = "TLS1_2"
  public_network_access_enabled = true

  tags      = local.tags

  lifecycle {
    prevent_destroy = true
    # ignore_changes = [
    #   azure_files_authentication
    # ]
  }
}

resource "azurerm_management_lock" "main" {
  count      = var.lock ? 1 : 0

  name       = lower(join("", [azurerm_storage_account.main.name, "lock"]))
  scope      = azurerm_storage_account.main.id
  lock_level = "CanNotDelete"
}