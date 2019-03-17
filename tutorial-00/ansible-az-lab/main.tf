resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group}"
  location = "${var.location}"

}


resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  location            = "${var.location}"
  address_space       = ["${var.address_space}"]
  resource_group_name = "${azurerm_resource_group.rg.name}"

}

resource "azurerm_subnet" "subnet_pub" {
  name                 = "private_subnet"
  virtual_network_name = "${var.vnet_name}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_prefix       = "10.0.100.0/24"
  }

resource "azurerm_subnet" "subnet_priv" {
  name                 = "private_subnet"
  virtual_network_name = "${var.vnet_name}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_prefix       = "10.0.1.0/24"
}


 module "linuxservers" {
    source              = "./module/vm"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    location            = "${var.location}"
    vm_hostname         = "vm"
    nb_public_ip        = "0"
    remote_port         = "22"
    nb_instances        = "3"
    vm_os_publisher     = "Canonical"
    vm_os_offer         = "UbuntuServer"
    vm_os_sku           = "18.04-LTS"
    ssh_key             = "${var.ssh_key}"
    vnet_subnet_id      = "${ azurerm_subnet.subnet_priv.id}"
    boot_diagnostics    = "false"
    delete_os_disk_on_termination = "true"

    tags                = {
                            environment = "dev"
                            costcenter  = "it"
                          }
  }

 module "bastion" {
    source              = "./module/vm"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    location            = "${var.location}"
    vm_hostname         = "vm"
    nb_public_ip        = "1"
    remote_port         = "22"
    nb_instances        = "1"
    vm_os_publisher     = "Canonical"
    vm_os_offer         = "UbuntuServer"
    vm_os_sku           = "18.04-LTS"
    ssh_key             = "${var.ssh_key}"
    vnet_subnet_id      = "${ azurerm_subnet.subnet_pub.id}"
    boot_diagnostics    = "false"
    delete_os_disk_on_termination = "true"

    tags                = {
                            environment = "dev"
                            costcenter  = "it"
                          }
  }