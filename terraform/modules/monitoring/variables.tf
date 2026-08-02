variable "workspace_name" {
  description = "Name of the Azure Log Analytics Workspace."
  type        = string

  validation {
    condition = (
      length(var.workspace_name) >= 4 &&
      length(var.workspace_name) <= 63
    )

    error_message = "The workspace name must contain between 4 and 63 characters."
  }
}

variable "location" {
  description = "Azure region for the monitoring resources."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the monitoring resources."
  type        = string
}

variable "sku" {
  description = "Log Analytics Workspace pricing tier."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Number of days to retain workspace data."
  type        = number
  default     = 30

  validation {
    condition = (
      var.retention_in_days >= 30 &&
      var.retention_in_days <= 730
    )

    error_message = "Retention must be between 30 and 730 days."
  }
}

variable "tags" {
  description = "Tags applied to monitoring resources."
  type        = map(string)
  default     = {}
}