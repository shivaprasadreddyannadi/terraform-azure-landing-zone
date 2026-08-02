variable "location" {
  description = "Azure region for development resources."
  type        = string
  default     = "centralus"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "application" {
  description = "Application or platform name."
  type        = string
  default     = "platform"
}

variable "owner" {
  description = "Team responsible for the resources."
  type        = string
  default     = "cloud-platform-team"
}

variable "cost_center" {
  description = "Cost center used for billing allocation."
  type        = string
  default     = "technology"
}