resource "azurerm_log_analytics_workspace" "law" {
  name                                    = var.app-name
  location                                = var.location
  resource_group_name                     = var.resource_group_name
  sku                                     = lookup(var.law_settings, "sku", "PerGB2018")
  retention_in_days                       = lookup(var.law_settings, "retention_in_days", 365)
  allow_resource_only_permissions         = lookup(var.law_settings, "allow_resource_only_permissions", true)
  local_authentication_enabled            = lookup(var.law_settings, "local_authentication_enabled", true)
  daily_quota_gb                          = lookup(var.law_settings, "daily_quota_gb", -1)
  cmk_for_query_forced                    = lookup(var.law_settings, "cmk_for_query_forced", false)
  internet_ingestion_enabled              = lookup(var.law_settings, "internet_ingestion_enabled", true)
  internet_query_enabled                  = lookup(var.law_settings, "internet_query_enabled", true)
  reservation_capacity_in_gb_per_day      = lookup(var.law_settings, "reservation_capacity_in_gb_per_day", null)
  data_collection_rule_id                 = lookup(var.law_settings, "data_collection_rule_id", null)
  immediate_data_purge_on_30_days_enabled = lookup(var.law_settings, "immediate_data_purge_on_30_days_enabled", null)

  dynamic "identity" {
    for_each = lookup(var.law_settings, "identity_type", null) != null ? [lookup(var.law_settings, "identity_type", null)] : []
    content {
      type         = lookup(var.law_settings, "identity_type", null)
      identity_ids = lookup(var.law_settings, "identity_ids", [])
    }
  }
}