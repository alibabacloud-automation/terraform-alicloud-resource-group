Alibaba Cloud Resource Manager Resource Group Terraform Module

# terraform-alicloud-resource-group

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-resource-group/blob/main/README-CN.md)

Terraform module which creates [Resource Manager Resource Group](https://www.alibabacloud.com/help/en/resource-management/latest/resource-group) on Alibaba Cloud.

This module provides a standardized way to create and manage resource groups in Alibaba Cloud. Resource groups allow you to organize and manage your cloud resources by project, environment, or organizational unit. This module also supports optional resource lock functionality using RAM policies to prevent accidental deletion or modification.

## Usage

Create a basic resource group with tags.

```terraform
module "resource_group" {
  source = "alibabacloud-automation/resource-group/alicloud"

  name         = "my-resource-group"
  display_name = "My Resource Group"
  tags = {
    Environment = "production"
    Project     = "migration"
  }
}
```

## Examples

* [Basic Example](https://github.com/alibabacloud-automation/terraform-alicloud-resource-group/tree/main/examples/basic)
* [Advanced Example](https://github.com/alibabacloud-automation/terraform-alicloud-resource-group/tree/main/examples/advanced)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0, < 2.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.82.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.272.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_ram_policy.lock_policy](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_policy) | resource |
| [alicloud_ram_role.lock_role](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_ram_role_policy_attachment.lock_attachment](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_role_policy_attachment) | resource |
| [alicloud_resource_manager_resource_group.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Optional. The display name of the resource group. The name must be 1 to 50 characters in length. If not specified, defaults to the value of `name`. | `string` | `null` | no |
| <a name="input_lock"></a> [lock](#input\_lock) | Optional. Controls the resource lock configuration for this resource group. `kind` - (Required) The type of lock, possible values are `CanNotDelete` and `ReadOnly`. `name` - (Optional) The name of the lock. | <pre>object({<br/>    kind = string<br/>    name = optional(string, null)<br/>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Required. The unique identifier of the resource group. The identifier must be 3 to 50 characters in length and can contain letters, digits, and hyphens (-). The identifier must start with a letter. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Optional. A mapping of tags to assign to the resource group. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | The ID of the Alibaba Cloud account to which the resource group belongs |
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | The display name of the resource group |
| <a name="output_name"></a> [name](#output\_name) | The unique identifier of the resource group |
| <a name="output_resource"></a> [resource](#output\_resource) | The full output for the resource group resource |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | The resource ID of the resource group |
| <a name="output_status"></a> [status](#output\_status) | The status of the resource group |
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
