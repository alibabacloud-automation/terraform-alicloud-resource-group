# Existing RAM User Example

This example demonstrates creating a resource group while using an existing RAM user:

- Resource group with tags
- Uses an existing RAM user (does not create a new one)
- Policy attachment using a system policy

## Prerequisites

Before running this example, ensure you have an existing RAM user named `existing-user` (or modify the `existing_user` variable).

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

**Note**: This will only destroy the resource group and policy attachment. The existing RAM user will not be modified or deleted.

**Cost**: This example creates resources that may incur costs. Remember to destroy resources when testing is complete.

## What This Example Creates

1. **Resource Group**: A new resource group with custom display name and tags
2. **Policy Attachment**: Links the existing RAM user to the resource group using a system policy (AliyunOSSReadOnlyAccess)

## What This Example Does NOT Create

- RAM User (uses existing user specified by `existing_ram_user_name`)
- Custom policies (uses Alibaba Cloud system policy instead)

## Example Configuration

```hcl
module "existing_ram_user" {
  source = "../.."

  create_resource_group = true
  resource_group = {
    name         = "example-rg"
    display_name = "Example with Existing RAM User"
    tags = {
      Environment = "Test"
    }
  }

  create_ram_user        = false
  existing_ram_user_name = "existing-user"

  create_policy_attachments = true
  policy_attachments = [
    {
      policy_name    = "AliyunOSSReadOnlyAccess"
      policy_type    = "System"
      principal_name = "existing-user@12345.onaliyun.com"
      principal_type = "IMSUser"
    }
  ]
}
```

## Variables

You can customize the example by providing values:

```bash
terraform apply -var="name=my-resource-group" -var="existing_user=my-existing-user"
```
