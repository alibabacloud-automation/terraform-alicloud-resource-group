阿里云资源管理资源组 Terraform 模块

# terraform-alicloud-resource-group

[English](https://github.com/alibabacloud-automation/terraform-alicloud-resource-group/blob/main/README.md) | 简体中文

在阿里云上创建和管理[资源管理资源组](https://help.aliyun.com/document_detail/94475.html)的 Terraform 模块。

该模块提供了一种标准化的方式来创建和管理阿里云中的资源组。资源组允许您按项目、环境或组织单位来组织和管理云资源。该模块还支持使用 RAM 策略实现可选的资源锁功能，防止资源被意外删除或修改。

## 使用方法

创建一个带有标签的基本资源组。

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

## 示例

* [基础示例](https://github.com/alibabacloud-automation/terraform-alicloud-resource-group/tree/main/examples/basic)
* [高级示例](https://github.com/alibabacloud-automation/terraform-alicloud-resource-group/tree/main/examples/advanced)

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

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
