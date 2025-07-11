# # main.tf (in your root deployment)

# resource "azurerm_resource_group" "my_citrix_rg" {
#   name     = "rg-citrix-env"
#   location = "East US 2"
# }

# module "citrix_log_analytics" {
#   source                  = "./modules/log-analytics-workspace" # Path to this module
#   resource_group_name     = azurerm_resource_group.my_citrix_rg.name
#   location                = azurerm_resource_group.my_citrix_rg.location
#   workspace_name          = "law-citrix-prod"
#   workspace_sku           = "PerGB2018"
#   workspace_retention_in_days = 90
#   tags                    = {
#     Project     = "Citrix"
#     Environment = "Production"
#     ManagedBy   = "Terraform"
#   }
# }

# # If a storage account is needed for general archiving of *ingested* logs,
# # you would manage that separately using azurerm_monitor_data_export_rule,
# # referencing the outputs of this LAW module and your separate storage account module.
# /*
# resource "azurerm_storage_account" "my_archive_sa" {
#   # ... resource definition for your archive storage account ...
# }

# resource "azurerm_monitor_data_export_rule" "export_all_logs" {
#   name                        = "export-all-to-sa"
#   resource_group_name         = azurerm_resource_group.my_citrix_rg.name
#   workspace_resource_id       = module.citrix_log_analytics.log_analytics_workspace_id
#   destination_resource_id     = azurerm_storage_account.my_archive_sa.id # Link to the storage account created elsewhere
#   enabled                     = true
#   table_names                 = ["*"] # Export all tables
# }
# */