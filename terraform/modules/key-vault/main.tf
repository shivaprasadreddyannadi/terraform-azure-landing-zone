resource "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = var.sku_name

  enable_rbac_authorization       = true
  purge_protection_enabled        = var.purge_protection_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days
  public_network_access_enabled   = var.public_network_access_enabled
  enabled_for_deployment          = false
  enabled_for_disk_encryption     = false
  enabled_for_template_deployment = false

  network_acls {
    bypass         = "AzureServices"
    default_action = var.network_default_action
  }

  tags = var.tags
}