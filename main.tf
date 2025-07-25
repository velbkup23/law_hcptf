resource "azurerm_resource_group" "law_rg" {
  name     = "${var.app-name}-rg"
  location = local.location

}

module "law" {
  source   = "./modules/law"
  for_each = { for item in local.flattened_monitor_resources : "${item.name}-${item.sequence}" => item if var.law_deploy}

  app-name            = each.value.name
  location            = local.location
  resource_group_name = azurerm_resource_group.law_rg.name
  law_settings        = each.value
  sequence            = each.value.sequence
  
}




# module "law" {
#   source = "./modules/law2"

#   for_each = {for item in var.mcd_law : item.name => item}

#   app-name            = each.key
#   location            = local.location
#   resource_group_name = azurerm_resource_group.law_rg.name

#   sku                                     = lookup(each.value, "sku", null)
#   retention_in_days                       = lookup(each.value, "retention_in_days", null)
#   allow_resource_only_permissions         = lookup(each.value, "allow_resource_only_permissions", null)
#   local_authentication_enabled            = lookup(each.value, "local_authentication_enabled", null)
#   daily_quota_gb                          = lookup(each.value, "daily_quota_gb", null)
#   cmk_for_query_forced                    = lookup(each.value, "cmk_for_query_forced", null)
#   identity_type                           = lookup(each.value, "identity_type", null)
#   identity_ids                            = lookup(each.value, "identity_ids", null)
#   internet_ingestion_enabled              = lookup(each.value, "internet_ingestion_enabled", null)
#   internet_query_enabled                  = lookup(each.value, "internet_query_enabled", null)
#   reservation_capacity_in_gb_per_day      = lookup(each.value, "reservation_capacity_in_gb_per_day", null)
#   data_collection_rule_id                 = lookup(each.value, "data_collection_rule_id", null)
#   immediate_data_purge_on_30_days_enabled = lookup(each.value, "immediate_data_purge_on_30_days_enabled", null)

# }

# resource "azurerm_monitor_diagnostic_setting" "law" {
#   name               = "${var.app-name}-diagnostic-setting"
#   target_resource_id = azurerm_log_analytics_workspace.law.id

#   log_analytics_destination_type = "Dedicated"

#   logs {
#     category = "AuditLogs"
#     enabled  = true
#   }

#   logs {
#     category = "SignInLogs"
#     enabled  = true
#   }

#   metrics {
#     category = "AllMetrics"
#     enabled  = true
#   }

#   workspace_id = azurerm_log_analytics_workspace.law.id

# }