variable "resource_group_name" {
  description = "The name of the Resource Group where the Log Analytics Workspace will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the Log Analytics Workspace will be deployed."
  type        = string
}

variable "workspace_name" {
  description = "The name for the Log Analytics Workspace. Must be globally unique."
  type        = string
}

variable "workspace_sku" {
  description = "The SKU for the Log Analytics Workspace (e.g., 'PerGB2018', 'CapacityReservation')."
  type        = string
  default     = "PerGB2018"
  validation {
    condition     = contains(["Free", "PerGB2018", "Standalone", "Standard", "Premium", "Unlimited", "CapacityReservation"], var.workspace_sku)
    error_message = "Invalid SKU. Refer to Azure Log Analytics pricing tiers for valid options."
  }
}

variable "workspace_retention_in_days" {
  description = "The number of days to retain data in the Log Analytics Workspace. Valid range is 30 to 730 days for 'PerGB2018' SKU."
  type        = number
  default     = 30
  validation {
    condition     = var.workspace_retention_in_days >= 30 && var.workspace_retention_in_days <= 730
    error_message = "Retention days must be between 30 and 730 for the 'PerGB2018' SKU."
  }
}

variable "tags" {
  description = "A map of tags to assign to the Log Analytics Workspace."
  type        = map(string)
  default     = {}
}