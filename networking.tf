resource "azurerm_virtual_network" "name" {
  name = "demo-vnet"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.dc.location
  resource_group_name = azurerm_resource_group.dc.name

  dns_servers = [ var.private_ip ]
}

resource "azurerm_subnet" "dc" {
  name                 = "Web"
  virtual_network_name = azurerm_virtual_network.name.name
  resource_group_name  = azurerm_resource_group.dc.name
  address_prefixes = [ "10.0.0.0/24" ]
}

resource "azurerm_network_security_group" "dc" {
  name                = "${var.workload}-${var.environment}-nsg"
  location            = azurerm_resource_group.dc.location
  resource_group_name = azurerm_resource_group.dc.name

  security_rule {
    name                       = "Allow-All-In"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

    security_rule {
    name                       = "Allow-All-Out"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "Allow-2"
  #   priority                   = 101
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "6516"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "*"
  # }

  # security_rule {
  #   name                       = "Allow-WAC443"
  #   priority                   = 101
  #   direction                  = "Outbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "443"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "WindowsAdminCenter"
  # }

  # security_rule {
  #   name                       = "Allow-AD443"
  #   priority                   = 102
  #   direction                  = "Outbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "443"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "AzureActiveDirectory"
  # }

  # security_rule {
  #   name                       = "Allow-WAC80"
  #   priority                   = 103
  #   direction                  = "Outbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "80"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "WindowsAdminCenter"
  # }

  # security_rule {
  #   name                       = "Allow-AD80"
  #   priority                   = 104
  #   direction                  = "Outbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "80"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "AzureActiveDirectory"
  # }
  

}

# resource "azurerm_network_interface_security_group_association" "dc" {
#   network_interface_id      = azurerm_network_interface.dc.id
#   network_security_group_id = azurerm_network_security_group.dc.id
# }

resource "azurerm_subnet_network_security_group_association" "main" {
  subnet_id                 = azurerm_subnet.dc.id
  network_security_group_id = azurerm_network_security_group.dc.id
}

resource "azurerm_public_ip" "dc" {
  name                = "${var.workload}-${var.environment}-pip"
  resource_group_name = azurerm_resource_group.dc.name
  location            = azurerm_resource_group.dc.location
  allocation_method   = "Dynamic"
  sku = "Basic"
}