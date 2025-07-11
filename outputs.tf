output "log_analytics_workspace_id" {
  description = "The Resource ID of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.main.id
}

output "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.main.name
}

output "log_analytics_workspace_primary_shared_key" {
  description = "The primary shared key for the Log Analytics Workspace. Use with caution as it's sensitive."
  value       = azurerm_log_analytics_workspace.main.primary_shared_key
  sensitive   = true
}

output "log_analytics_workspace_customer_id" {
  description = "The Customer ID (Workspace ID) for the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.main.workspace_id
}