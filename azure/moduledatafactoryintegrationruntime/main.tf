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

resource "azurerm_data_factory_integration_runtime_self_hosted" "main" {
  name            = upper("selfhosted")
  data_factory_id = var.data_factory.id
}