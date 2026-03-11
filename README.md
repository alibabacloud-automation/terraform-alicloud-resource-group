Alibaba Cloud Resource Manager Resource Group Terraform Module

# terraform-alicloud-resource-group

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-resource-group/blob/main/README-CN.md)

Terraform module which creates [Resource Manager Resource Group](https://www.alibabacloud.com/help/en/resource-management/latest/resource-group) on Alibaba Cloud.

This module provides a standardized way to create and manage resource groups in Alibaba Cloud. Resource groups allow you to organize and manage your cloud resources by project, environment, or organizational unit. This module also supports optional resource lock functionality using RAM policies to prevent accidental deletion or modification.

## Usage

Create a basic resource group with RAM user and policy management.

```terraform
module "resource_group" {
  source = "alibabacloud-automation/resource-group/alicloud"

  create_resource_group = true
  resource_group = {
    name         = "my-resource-group"
    display_name = "My Resource Group"
    tags = {
      Environment = "production"
      Project     = "migration"
    }
  }

  create_ram_user = true
  ram_user = {
    name         = "my-resource-group"
    display_name = "Resource Group Admin"
    email        = "admin@example.com"
  }

  create_custom_policies = true
  custom_policies = [
    {
      policy_name     = "custom-oss-policy"
      policy_document = jsonencode({
        Statement = [{
          Action   = ["oss:*"]
          Effect   = "Allow"
          Resource = ["acs:oss:*:*:*"]
        }]
        Version = "1"
      })
      description = "OSS access policy"
    }
  ]
}
```

## Examples

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-resource-group/tree/main/examples/complete)
* [Existing RAM User Example](https://github.com/alibabacloud-automation/terraform-alicloud-resource-group/tree/main/examples/existing-ram-user)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0, < 2.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.82.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.82.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_ram_user.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_user) | resource |
| [alicloud_resource_manager_policy.custom](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_policy) | resource |
| [alicloud_resource_manager_policy_attachment.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_policy_attachment) | resource |
| [alicloud_resource_manager_resource_group.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_custom_policies"></a> [create\_custom\_policies](#input\_create\_custom\_policies) | Whether to create custom Resource Manager policies. | `bool` | `false` | no |
| <a name="input_create_policy_attachments"></a> [create\_policy\_attachments](#input\_create\_policy\_attachments) | Whether to create policy attachments to the resource group. | `bool` | `false` | no |
| <a name="input_create_ram_user"></a> [create\_ram\_user](#input\_create\_ram\_user) | Whether to create a new RAM user. | `bool` | `false` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create a new resource group. | `bool` | `true` | no |
| <a name="input_custom_policies"></a> [custom\_policies](#input\_custom\_policies) | List of custom Resource Manager policies to create. | <pre>list(object({<br/>    policy_name     = string<br/>    policy_document = string<br/>    description     = optional(string, "")<br/>  }))</pre> | `[]` | no |
| <a name="input_existing_ram_user_name"></a> [existing\_ram\_user\_name](#input\_existing\_ram\_user\_name) | Name of existing RAM user to use when create\_ram\_user is false. | `string` | `""` | no |
| <a name="input_existing_resource_group_id"></a> [existing\_resource\_group\_id](#input\_existing\_resource\_group\_id) | ID of existing resource group to use when create\_resource\_group is false. | `string` | `""` | no |
| <a name="input_policy_attachments"></a> [policy\_attachments](#input\_policy\_attachments) | List of policy attachments to apply to the resource group. Each attachment should specify policy\_name, policy\_type (System or Custom), principal\_name, and principal\_type (IMSUser, IMSGroup, or ServiceRole). | <pre>list(object({<br/>    policy_name    = string<br/>    policy_type    = optional(string, "Custom")<br/>    principal_name = string<br/>    principal_type = string<br/>  }))</pre> | `[]` | no |
| <a name="input_ram_user"></a> [ram\_user](#input\_ram\_user) | RAM user configuration. `name` - Name for new RAM user, defaults to resource group name. `display_name` - Display name. `mobile` - Mobile phone number. `email` - Email address. `comments` - Comments. | <pre>object({<br/>    name         = optional(string)<br/>    display_name = optional(string)<br/>    mobile       = optional(string)<br/>    email        = optional(string)<br/>    comments     = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group configuration. `name` - The unique identifier (3-50 chars, start with letter). `display_name` - Display name, defaults to name. `tags` - Tags to assign. | <pre>object({<br/>    name         = string<br/>    display_name = optional(string)<br/>    tags         = optional(map(string), {})<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | The ID of the Alibaba Cloud account to which the resource group belongs |
| <a name="output_custom_policies"></a> [custom\_policies](#output\_custom\_policies) | The created custom Resource Manager policies |
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | The display name of the resource group |
| <a name="output_name"></a> [name](#output\_name) | The unique identifier of the resource group |
| <a name="output_policy_attachments"></a> [policy\_attachments](#output\_policy\_attachments) | The policy attachments to the resource group |
| <a name="output_ram_user_id"></a> [ram\_user\_id](#output\_ram\_user\_id) | The ID of the created RAM user |
| <a name="output_ram_user_name"></a> [ram\_user\_name](#output\_ram\_user\_name) | The name of the RAM user (created or existing) |
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
