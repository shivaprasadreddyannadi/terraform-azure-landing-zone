variable "key_vault_name" {
  description = "Globally unique name of the Azure Key Vault."
  type        = string

  validation {
    condition = (
      length(var.key_vault_name) >= 3 &&
      length(var.key_vault_name) <= 24 &&
      can(regex("^[a-zA-Z][a-zA-Z0-9-]*[a-zA-Z0-9]$", var.key_vault_name))
    )

    error_message = "The Key Vault name must contain 3 to 24 alphanumeric characters or hyphens, start with a letter, and end with an alphanumeric character."
  }
}

variable "location" {
  description = "Azure region where the Key Vault is created."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the Key Vault."
  type        = string
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID associated with the Key Vault."
  type        = string
}

variable "sku_name" {
  description = "Key Vault service tier."
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "The SKU must be either standard or premium."
  }
}

variable "soft_delete_retention_days" {
  description = "Number of days deleted vault content remains recoverable."
  type        = number
  default     = 7

  validation {
    condition = (
      var.soft_delete_retention_days >= 7 &&
      var.soft_delete_retention_days <= 90
    )

    error_message = "Soft-delete retention must be between 7 and 90 days."
  }
}

variable "purge_protection_enabled" {
  description = "Whether purge protection is enabled."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the Key Vault."
  type        = bool
  default     = true
}

variable "network_default_action" {
  description = "Default network action when no network rule matches."
  type        = string
  default     = "Deny"

  validation {
    condition     = contains(["Allow", "Deny"], var.network_default_action)
    error_message = "The network default action must be Allow or Deny."
  }
}

variable "tags" {
  description = "Tags applied to the Key Vault."
  type        = map(string)
  default     = {}
}