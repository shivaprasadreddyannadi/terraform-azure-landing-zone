# Azure Key Vault Module

This module creates an Azure Key Vault for centralized management of application secrets, certificates, and encryption keys.

## Capabilities

- Azure RBAC authorization
- Configurable Standard or Premium SKU
- Soft-delete retention
- Optional purge protection
- Configurable public network access
- Default-deny network ACL support
- Standard platform tags
- Reusable resource outputs

## Security Decisions

- Azure RBAC is enabled instead of inline access policies.
- No secrets are stored in Terraform source files.
- Network access defaults to deny.
- Azure trusted services can bypass the network restriction.
- Soft delete is enabled by the Azure platform.
- Purge protection is configurable by environment.

## Environment Guidance

Development environments can keep purge protection disabled to allow lab cleanup.

Production environments should enable purge protection to reduce the risk of accidental or malicious permanent deletion.

## Example

```hcl
module "key_vault" {
  source = "../../modules/key-vault"

  key_vault_name       = "kvexampledevcus001"
  location             = "centralus"
  resource_group_name  = "rg-platform-dev-centralus"
  tenant_id            = data.azurerm_client_config.current.tenant_id

  sku_name                   = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}