resource "azurerm_log_analytics_workspace" "main" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.workspace_sku
  retention_in_days   = var.workspace_retention_in_days
  tags                = var.tags
}

# Diagnostic settings for the Log Analytics Workspace itself.
# This sends the LAW's own operational logs and metrics to itself (or another LAW).
# This is a best practice for monitoring the health and usage of your Log Analytics Workspace.
resource "azurerm_monitor_diagnostic_setting" "law_diagnostics" {
  name                       = "${azurerm_log_analytics_workspace.main.name}-diag"
  target_resource_id         = azurerm_log_analytics_workspace.main.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id # Sending LAW's own logs to itself for monitoring

  # Configure which internal logs of the LAW to collect
  log {
    category = "Audit"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 365 # Retain LAW audit logs for 1 year
    }
  }

  log {
    category = "Usage"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 365
    }
  }

  # Configure which internal metrics of the LAW to collect
  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 365
    }
  }
}