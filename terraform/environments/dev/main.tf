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
module "hub_network" {
  source = "../../modules/networking"

  virtual_network_name = "vnet-hub-${var.environment}-${var.location}"
  location             = var.location
  resource_group_name  = module.network_resource_group.name
  address_space        = ["10.0.0.0/16"]

  subnets = {
    "snet-shared-services" = {
      address_prefixes = ["10.0.1.0/24"]
    }

    "snet-management" = {
      address_prefixes = ["10.0.2.0/24"]
    }

    "snet-private-endpoints" = {
      address_prefixes = ["10.0.3.0/24"]
    }
  }

  tags = merge(local.common_tags, {
    Application = "networking"
  })
}