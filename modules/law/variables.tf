variable "app-name" {
  description = "App-name for the name of the workspace."
  type        = string
}

variable "location" {
  description = "The Azure region where the workspace will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the workspace will be created."
  type        = string
}

variable "sequence" {
  description = "A sequence number to append to the workspace name for uniqueness."
  type        = string
  default     = "1"
  
}

variable "law_settings" {
  type = object({
    sku                                     = optional(string)
    retention_in_days                       = optional(number)
    allow_resource_only_permissions         = optional(bool)
    local_authentication_enabled            = optional(bool)
    daily_quota_gb                          = optional(number)
    cmk_for_query_forced                    = optional(bool)
    identity_type                           = optional(string)
    identity_ids                            = optional(list(string))
    internet_ingestion_enabled              = optional(bool)
    internet_query_enabled                  = optional(bool)
    reservation_capacity_in_gb_per_day      = optional(number)
    data_collection_rule_id                 = optional(string)
    immediate_data_purge_on_30_days_enabled = optional(bool)
  })
  default = {}
}