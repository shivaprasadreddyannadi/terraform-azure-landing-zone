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