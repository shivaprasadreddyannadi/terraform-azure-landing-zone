# Terraform Azure Landing Zone

[![Terraform Validation](https://github.com/shivaprasadreddyannadi/terraform-azure-landing-zone/actions/workflows/terraform-validate.yml/badge.svg)](https://github.com/shivaprasadreddyannadi/terraform-azure-landing-zone/actions/workflows/terraform-validate.yml)
![Terraform](https://img.shields.io/badge/Terraform-1.15+-844FBA?logo=terraform)
![Azure](https://img.shields.io/badge/Microsoft_Azure-Platform-0078D4?logo=microsoftazure)
![License](https://img.shields.io/badge/License-MIT-green)

Enterprise-style Azure Landing Zone implemented with reusable Terraform modules, secure networking, centralized monitoring, Key Vault, standardized tagging, and automated GitHub Actions validation.

## Business Problem

Organizations migrating workloads to Azure often face inconsistent naming, manually created infrastructure, weak access controls, missing monitoring, overlapping networks, and limited deployment standards.

This project provides a reusable Infrastructure as Code foundation that application teams can use to deploy Azure environments consistently.

## Implemented Capabilities

- Reusable Azure resource-group module
- Hub virtual network and subnet creation
- Network Security Groups
- Centralized Log Analytics Workspace
- Azure Key Vault with RBAC support
- Common naming and tagging standards
- Development environment configuration
- Terraform formatting and validation
- GitHub Actions CI workflow
- Provider dependency lock file

## Architecture

![Azure Landing Zone Architecture](architecture/landing-zone.png)

The editable source is available at [`architecture/landing-zone.drawio`](architecture/landing-zone.drawio).

## Repository Structure

```text
terraform-azure-landing-zone/
├── .github/
│   ├── workflows/
│   │   └── terraform-validate.yml
│   └── CODEOWNERS
├── architecture/
│   ├── landing-zone.drawio
│   └── landing-zone.png
├── docs/
│   ├── architecture.md
│   ├── deployment.md
│   ├── networking.md
│   ├── security.md
│   └── troubleshooting.md
├── examples/
│   └── dev/
├── terraform/
│   ├── environments/
│   │   └── dev/
│   └── modules/
│       ├── resource-group/
│       ├── networking/
│       ├── monitoring/
│       └── key-vault/
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE
├── .gitignore
└── README.md