variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vnet_cidr" {
  type = string
}

variable "subnets" {
  type = map(object({
    cidr = string
  }))
}

variable "tags" {
  type = map(string)
  default = {}
}