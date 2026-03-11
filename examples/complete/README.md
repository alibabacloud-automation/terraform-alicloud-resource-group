# Complete Example

This example demonstrates creating all resources from scratch:

- Resource group with tags
- RAM user with display name, email, and comments
- Custom Resource Manager policy for OSS access
- Policy attachment linking the RAM user to the resource group

## Usage

To run this example:

```bash
terraform init
terraform plan
terraform apply
```

To destroy the resources:

```bash
terraform destroy
```

## What This Example Creates

1. **Resource Group**: A new resource group with custom display name and tags
2. **RAM User**: A new RAM user with:
   - Name
   - Display name
   - Email address
   - Comments
3. **Custom Policy**: A Resource Manager policy granting OSS full access
4. **Policy Attachment**: Links the RAM user to the resource group with the custom policy

## Example Configuration

```hcl
module "complete" {
  source = "../.."

  create_resource_group = true
  resource_group = {
    name         = "example-rg"
    display_name = "Complete Example Resource Group"
    tags = {
      Environment = "Test"
      ManagedBy   = "Terraform"
    }
  }

  create_ram_user = true
  ram_user = {
    name         = "example-user"
    display_name = "Example User"
    email        = "user@example.com"
    comments     = "Created by Terraform"
  }

  create_custom_policies = true
  custom_policies = [
    {
      policy_name     = "oss-policy"
      policy_document = jsonencode({...})
      description     = "Custom policy for OSS access"
    }
  ]

  create_policy_attachments = true
  policy_attachments = [
    {
      policy_name    = "oss-policy"
      policy_type    = "Custom"
      principal_name = "example-user@12345.onaliyun.com"
      principal_type = "IMSUser"
    }
  ]
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| alicloud | >= 1.120.0 |

## Outputs

| Name | Description |
|------|-------------|
| resource_group_id | The ID of the created resource group |
| resource_group_name | The name of the created resource group |
| ram_user_name | The name of the created RAM user |
| ram_user_id | The ID of the created RAM user |
| custom_policies | The created custom policies |
| policy_attachments | The policy attachments |
