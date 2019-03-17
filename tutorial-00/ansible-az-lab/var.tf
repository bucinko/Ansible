
variable "location" {
 default = "westeurope"
}

variable "resource_group" {
 default = "ansible-az-lab"
}


variable "vnet_name" {
 default = "ansible-lab-vnet"
}

variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  default     = []
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}


variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  default     = ["subnet1"]
}