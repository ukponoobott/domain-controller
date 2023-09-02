https://www.youtube.com/watch?v=1vWSKLX0Xrk

https://activedirectorypro.com/deploy-domain-controller-azure/

https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/deploy/install-active-directory-domain-services--level-100-

https://docs.microsoft.com/en-us/powershell/module/addsdeployment/install-addsforest?view=windowsserver2022-ps

https://cloudblogs.microsoft.com/industry-blog/en-gb/technetuk/2016/06/08/setting-up-active-directory-via-powershell/

https://activedirectorypro.com/deploy-domain-controller-azure/

Windows Admin Center
https://learn.microsoft.com/en-us/windows-server/manage/windows-admin-center/azure/manage-vm

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_interface.dc](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.dc](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.dc](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.dc](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.dc](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_machine_extension.dc](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_network.name](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/virtual_network) | resource |
| [azurerm_windows_virtual_machine.dc](https://registry.terraform.io/providers/hashicorp/azurerm/3.20.0/docs/resources/windows_virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | (Required) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created. | `string` | `""` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | (Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created. | `string` | `""` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | `"contosso.org"` | no |
| <a name="input_domain_net_bios_name"></a> [domain\_net\_bios\_name](#input\_domain\_net\_bios\_name) | n/a | `string` | `"CONTOSSO"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) The environment where the workload should exist. | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created. | `string` | `"eastus2"` | no |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | n/a | `string` | `"10.0.0.5"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | (Required) The SKU which should be used for this Virtual Machine, such as Standard\_F2 | `string` | `"Standard_B1s"` | no |
| <a name="input_workload"></a> [workload](#input\_workload) | (Required) The prefix of the workload delployed. | `string` | `"dc"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->