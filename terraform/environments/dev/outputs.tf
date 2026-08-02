output "platform_resource_group_name" {
  description = "Platform resource group name."
  value       = module.platform_resource_group.name
}

output "network_resource_group_name" {
  description = "Network resource group name."
  value       = module.network_resource_group.name
}

output "hub_virtual_network_name" {
  description = "Name of the development hub virtual network."
  value       = module.hub_network.virtual_network_name
}

output "hub_subnet_ids" {
  description = "IDs of the development hub subnets."
  value       = module.hub_network.subnet_ids
}

output "log_analytics_workspace_id" {
  description = "Resource ID of the development Log Analytics Workspace."
  value       = module.platform_monitoring.workspace_id
}

output "log_analytics_workspace_name" {
  description = "Name of the development Log Analytics Workspace."
  value       = module.platform_monitoring.workspace_name
}
output "key_vault_id" {
  description = "Resource ID of the development Azure Key Vault."
  value       = module.platform_key_vault.id
}

output "key_vault_name" {
  description = "Name of the development Azure Key Vault."
  value       = module.platform_key_vault.name
}

output "key_vault_uri" {
  description = "URI of the development Azure Key Vault."
  value       = module.platform_key_vault.vault_uri
}