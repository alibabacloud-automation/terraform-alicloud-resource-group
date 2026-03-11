

# Get Alicloud Account Id
data "alicloud_account" "this" {}

# Create all resources: resource group, RAM user, custom policy, and policy attachment
module "complete" {
  source = "../.."

  # Create resource group
  create_resource_group = true
  resource_group = {
    name         = var.name
    display_name = "Complete Example Resource Group"
    tags = {
      Environment = "Test"
      ManagedBy   = "Terraform"
      Example     = "complete"
    }
  }

  # Create RAM user
  create_ram_user = true
  ram_user = {
    name         = var.name
    display_name = "Example User"
    email        = "user@example.com"
    comments     = "Created by Terraform complete example"
  }

  # Create custom policies
  create_custom_policies = true
  custom_policies = [
    {
      policy_name = "${var.name}-oss-policy"
      policy_document = jsonencode({
        Statement = [{
          Action   = ["oss:*"]
          Effect   = "Allow"
          Resource = ["acs:oss:*:*:*"]
        }]
        Version = "1"
      })
      description = "Custom policy for OSS full access"
    }
  ]

  # Attach policies to resource group
  create_policy_attachments = true
  policy_attachments = [
    {
      policy_name    = "${var.name}-oss-policy"
      policy_type    = "Custom"
      principal_name = format("%s@%s.onaliyun.com", var.name, data.alicloud_account.this.id)
      principal_type = "IMSUser"
    }
  ]
}
