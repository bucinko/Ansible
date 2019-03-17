resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group}"
  location = "${var.location}"

}

module "network" {
    source              = "./module/vnet"
    resource_group_name = "ansible-az-lab"
    location            = "westeurope"
    address_space       = "10.0.0.0/16"
    subnet_prefixes     = ["10.0.1.0/24", "10.0.100.0/24"]
    subnet_names        = ["private_subnet", "public_subnet"]

    tags                = {
                            environment = "ansible-az-lab"
                          }
}

#Azure Generic vNet Module


resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  location            = "${var.location}"
  address_space       = ["${var.address_space}"]
  resource_group_name = "${var.resource_group}"

}

resource "azurerm_subnet" "subnet_pub" {
  name                 = "private_subnet"
  virtual_network_name = "${var.vnet_name}"
  resource_group_name  = "${var.resource_group}"
  address_prefix       = "10.0.100.0/24"
  }

resource "azurerm_subnet" "subnet_priv" {
  name                 = "private_subnet"
  virtual_network_name = "${var.vnet_name}"
  resource_group_name  = "${var.resource_group}"
  address_prefix       = "10.0.1.0/24"
}


resource "azurerm_network_security_group" "sg" {
  name                = "ansible-az-sg"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
}


resource "azurerm_network_security_rule" "test" {
  name                        = "SSH inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${var.resource_group}"
  network_security_group_name = "${azurerm_network_security_group.sg.name}"
}

 module "linuxservers" {
    source              = "github.com/Azure/terraform-azurerm-compute"
    resource_group_name = "${var.resource_group}"
    location            = "${var.location}"
    vm_hostname         = "vm"
    nb_public_ip        = "0"
    remote_port         = "22"
    nb_instances        = "3"
    vm_os_publisher     = "Canonical"
    vm_os_offer         = "UbuntuServer"
    vm_os_sku           = "18.04-LTS"
    vnet_subnet_id      = "${ azurerm_subnet.subnet_priv.id}"
    boot_diagnostics    = "true"
    delete_os_disk_on_termination = "true"

    tags                = {
                            environment = "dev"
                            costcenter  = "it"
                          }
  }