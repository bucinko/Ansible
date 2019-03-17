
variable "location" {
 default = "westeurope"
}

variable "resource_group" {
 default = "ansible-az-lab"
}

variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgae6f1UC2FbcLU3UkCQfYFa6U87r+D/E4T1VeVJcsnI3GCMETEvhVoQQQwfX5BUezMTk0F2lg4ilwnUi6vt2N7nkb74dVWTUWrQ8mbPDARhkwWwVie7L706BOv8ZGv+VLJYo9I+AC0d0CF6/v3kn1Gy96WGyUNcUeiF/cUGR3M3GZvzCqnGMnXQA8hYd+Jh9sR6V50p33PexlO0yTvySRaiAPil2i5Pc4DMhi7r6m/tYh7GLpDF/23IBT4AQwyffMww3oWLxG9Jeyue9j1YpHN60EBNDbKK6JQCshYkqcqZBNHt25Q4ezh7T5GUKwGjiRA7w5sSGtF6p1cDy3WPe1 root@tester1.example.com"

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