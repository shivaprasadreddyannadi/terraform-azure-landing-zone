output "id" {
  description = "Resource ID of the Azure Key Vault."
  value       = azurerm_key_vault.this.id
}

output "name" {
  description = "Name of the Azure Key Vault."
  value       = azurerm_key_vault.this.name
}

output "vault_uri" {
  description = "URI used to access the Azure Key Vault."
  value       = azurerm_key_vault.this.vault_uri
}

output "resource_group_name" {
  description = "Resource group containing the Azure Key Vault."
  value       = azurerm_key_vault.this.resource_group_name
}