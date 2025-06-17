output "id" {
  description = "Id do Integration Runtime Self Hosted"
  value       = azurerm_data_factory_integration_runtime_self_hosted.main[*].id
  sensitive   = true
  depends_on = [azurerm_data_factory_integration_runtime_self_hosted.main]
}
output "runtime_self_hosted_primary_key" {
  description = "Chave primária do runtime self hosted"
  value       = azurerm_data_factory_integration_runtime_self_hosted.main[*].primary_authorization_key
  sensitive   = true
  depends_on = [azurerm_data_factory_integration_runtime_self_hosted.main]
}
output "runtime_self_hosted_secondary_key" {
  description = "Chave secundária do runtime self hosted"
  value       = azurerm_data_factory_integration_runtime_self_hosted.main[*].secondary_authorization_key
  sensitive   = true
  depends_on = [azurerm_data_factory_integration_runtime_self_hosted.main]
}