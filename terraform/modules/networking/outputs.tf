output "virtual_network_id" {
  description = "ID of the virtual network."
  value       = azurerm_virtual_network.this.id
}

output "virtual_network_name" {
  description = "Name of the virtual network."
  value       = azurerm_virtual_network.this.name
}

output "subnet_ids" {
  description = "Map of subnet names and IDs."

  value = {
    for name, subnet in azurerm_subnet.this :
    name => subnet.id
  }
}

output "network_security_group_ids" {
  description = "Map of Network Security Group names and IDs."

  value = {
    for name, nsg in azurerm_network_security_group.this :
    name => nsg.id
  }
}