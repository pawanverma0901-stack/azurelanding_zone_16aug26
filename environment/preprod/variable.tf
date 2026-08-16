variable "rgs" {
  description = "Map of Resource Groups configuration"
  type        = any
}

variable "vnets" {
  description = "Map of Virtual Networks configuration"
  type        = any
}

variable "subnets" {
  description = "Map of Subnets configuration"
  type        = any
}

variable "pips" {
  description = "Map of Public IPs configuration"
  type        = any
}

variable "nsgs" {
  description = "Map of Network Security Groups configuration"
  type        = any
}

variable "vms" {
  description = "Map of Virtual Machines configuration"
  type        = any
}
