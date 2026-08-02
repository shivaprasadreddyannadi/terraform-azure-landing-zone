output "platform_resource_group_name" {
  description = "Platform resource group name."
  value       = module.platform_resource_group.name
}

output "network_resource_group_name" {
  description = "Network resource group name."
  value       = module.network_resource_group.name
}