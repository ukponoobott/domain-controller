resource "azurerm_resource_group" "dc" {
  name     = "${var.workload}-${var.environment}-rg"
  location = var.location   
}

resource "azurerm_network_interface" "dc" {
  name                = "${var.workload}-${var.environment}-nic"
  location            = azurerm_resource_group.dc.location
  resource_group_name = azurerm_resource_group.dc.name

  ip_configuration {
    name                          = "${var.workload}-${var.environment}-ipconfig"
    subnet_id                     = azurerm_subnet.dc.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_ip
    public_ip_address_id = azurerm_public_ip.dc.id
  }

}

resource "azurerm_windows_virtual_machine" "dc" {
  name                = "${var.workload}-host-${var.environment}"
  resource_group_name = azurerm_resource_group.dc.name
  location            = azurerm_resource_group.dc.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.dc.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

}

 resource "azurerm_virtual_machine_extension" "dc" {
    name                 = "${var.workload}-${var.environment}-ad-join"
    virtual_machine_id   = azurerm_windows_virtual_machine.dc.id
    publisher            = "Microsoft.Compute"
    type                 = "CustomScriptExtension"
    type_handler_version = "1.9"
    settings             = <<SETTINGS
      {
        "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File setup-forest.ps1 -password ${var.admin_password} -domain ${var.domain} -domainNetBiosName ${var.domain_net_bios_name}",
        "fileUris": ["https://raw.githubusercontent.com/ukponoobott/toolbox/main/scripts/setup-forest.ps1"]
      }
  SETTINGS

  depends_on = [
    azurerm_windows_virtual_machine.dc
  ]
  lifecycle {
    ignore_changes = [ type_handler_version ]
  }
  }