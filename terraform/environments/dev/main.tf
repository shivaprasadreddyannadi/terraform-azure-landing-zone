locals {
  common_tags = {
    Environment = var.environment
    Application = var.application
    Owner       = var.owner
    CostCenter  = var.cost_center
    ManagedBy   = "terraform"
    Criticality = "medium"
  }
}

module "platform_resource_group" {
  source = "../../modules/resource-group"

  name     = "rg-${var.application}-${var.environment}-${var.location}"
  location = var.location
  tags     = local.common_tags
}

module "network_resource_group" {
  source = "../../modules/resource-group"

  name     = "rg-network-${var.environment}-${var.location}"
  location = var.location

  tags = merge(local.common_tags, {
    Application = "networking"
  })
}