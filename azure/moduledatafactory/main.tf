data "azurerm_client_config" "current" {}

locals {
  tags = {
      empresa      = var.empresa
      environment  = var.ambiente
      object_id    = data.azurerm_client_config.current.object_id
  }
}

resource "azurerm_data_factory" "main" {
  name                = var.datafactory_name == "" ? lower(join("", [var.empresa,"df",var.ambiente])) : lower(join("", [var.empresa,var.datafactory_name,var.ambiente]))
  location            = var.location
  resource_group_name = var.resource_group.name
}