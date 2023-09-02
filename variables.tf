variable "environment" {
  description = "(Required) The environment where the workload should exist."
  type        = string
  default     = "dev"
}

variable "workload" {
  description = "(Required) The prefix of the workload delployed."
  type        = string
  default     = "dc"
}

variable "location" {
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  type        = string
  default     = "eastus2"
}


variable "private_ip" {
  default = "10.0.0.5"
}

variable "vm_size" {
  description = "(Required) The SKU which should be used for this Virtual Machine, such as Standard_F2"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "(Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "admin_password" {
  description = "(Required) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "domain" {
  default = "contosso.org"
}

variable "domain_net_bios_name" {
  default = "CONTOSSO"
}