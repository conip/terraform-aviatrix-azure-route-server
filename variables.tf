variable "name" {
  description = "Name to be used for Azure Route Server related components."
  type        = string
}

variable "cidr" {
  description = "CIDR for VNET creation."
  type        = string

  validation {
    condition     = var.cidr != "" ? can(cidrnetmask(var.cidr)) : true
    error_message = "This does not like a valid CIDR."
  }

  validation {
    condition     = split("/", var.cidr)[1] >= 27
    error_message = "CIDR size too small. Needs to be at least a /27."
  }
}

variable "transit_vnet_obj" {
  description = "ID of transit VNET"
  #type        = map(any)
}

variable "transit_gw_obj" {
  description = "Name of the transit gateway."
  #type        = map(any)
}

variable "region" {
  description = "Azure region where to deploy ARS."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name, in case you want to use an existing resource group."
  type        = string
  default     = ""
  nullable    = false
}

locals {
  existing_resource_group = length(var.resource_group_name) > 0
  resource_group_name     = local.existing_resource_group ? var.resource_group_name : azurerm_resource_group.default[0].name
}
