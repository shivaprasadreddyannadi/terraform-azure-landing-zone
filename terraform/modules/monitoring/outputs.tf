output "workspace_id" {
  description = "Resource ID of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.this.id
}

output "workspace_name" {
  description = "Name of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.this.name
}

output "workspace_resource_group_name" {
  description = "Resource group containing the workspace."
  value       = azurerm_log_analytics_workspace.this.resource_group_name
}

output "workspace_customer_id" {
  description = "Workspace customer ID."
  value       = azurerm_log_analytics_workspace.this.workspace_id
}