output "id" {
  value = azurerm_storage_account.main.id
  sensitive = false
}
output "name" {
  value = azurerm_storage_account.main.name
  sensitive = false
}
output "resource_group_name" {
  value = azurerm_storage_account.main.resource_group_name
  sensitive = false
}
output "location" {
  value = azurerm_storage_account.main.location
  sensitive = false
}
output "primary_connection_string" {
  value = azurerm_storage_account.main.primary_connection_string
  sensitive = true
}
output "primary_access_key" {
  value = azurerm_storage_account.main.primary_access_key
  sensitive = true
}
output primary_blob_endpoint {
  value       = azurerm_storage_account.main.primary_blob_endpoint
  sensitive   = false
}
output primary_blob_host {
  value       = azurerm_storage_account.main.primary_blob_host
  sensitive   = false
}
output primary_queue_endpoint {
  value       = azurerm_storage_account.main.primary_queue_endpoint
  sensitive   = false
}
output primary_queue_host {
  value       = azurerm_storage_account.main.primary_queue_host
  sensitive   = false
}
output primary_table_endpoint {
  value       = azurerm_storage_account.main.primary_table_endpoint
  sensitive   = false
}
output primary_table_host {
  value       = azurerm_storage_account.main.primary_table_host
  sensitive   = false
}
output primary_file_endpoint {
  value       = azurerm_storage_account.main.primary_file_endpoint
  sensitive   = false
}
output primary_file_host {
  value       = azurerm_storage_account.main.primary_file_host
  sensitive   = false
}
output primary_blob_connection_string  {
  value       = azurerm_storage_account.main.primary_blob_connection_string
  sensitive   = true
}