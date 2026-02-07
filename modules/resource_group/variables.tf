variable "name" {
  type = string
  description = "Resource Group Name"
}

variable "location" {
  type = string
  description = "Azure Region"
}

variable "tags" {
  type = map(string)
  default = {}
}