data "azurerm_client_config" "current" {}

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
module "platform_monitoring" {
  source = "../../modules/monitoring"

  workspace_name      = "log-${var.application}-${var.environment}-${var.location}"
  location            = var.location
  resource_group_name = module.platform_resource_group.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = merge(local.common_tags, {
    Application = "monitoring"
  })
}

module "platform_key_vault" {
  source = "../../modules/key-vault"

  key_vault_name      = var.key_vault_name
  location            = var.location
  resource_group_name = module.platform_resource_group.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name                      = "standard"
  soft_delete_retention_days    = 7
  purge_protection_enabled      = false
  public_network_access_enabled = true
  network_default_action        = "Deny"

  tags = merge(local.common_tags, {
    Application = "security"
  })
}