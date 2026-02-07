variable "location" {
  description = "Azure Region where resources will be created"
  type = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type = string
}

variable "vnet_cidr" {
  description = "CIDR block for vnet"
  type = string
}

variable "subnets" {
  description = "subnet configuration"
  type = map(object({
    cidr = string
  }))
}

variable "tags" {
  description = "common tags for all resources"
  type = map(string)
  default = {}
}

variable "test"{
  description = "to test"
  type = string
  default = ""
}