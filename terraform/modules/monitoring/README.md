# Monitoring Module

This module creates a centralized Azure Log Analytics Workspace for platform and workload monitoring.

## Capabilities

- Configurable workspace name
- Configurable Azure region
- Configurable pricing tier
- Configurable data retention
- Standard platform tags
- Reusable outputs for future diagnostic settings

## Example

```hcl
module "monitoring" {
  source = "../../modules/monitoring"

  workspace_name     = "log-platform-dev-centralus"
  location           = "centralus"
  resource_group_name = "rg-platform-dev-centralus"
  retention_in_days  = 30

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}