
# Get Alicloud Account Id
data "alicloud_account" "this" {}

# Create a RAM user to simulate an existing user (for testing purposes)
resource "alicloud_ram_user" "existing" {
  name         = var.existing_user
  display_name = "Existing User for Example"
  comments     = "This user simulates a pre-existing RAM user"
}

# Create resource group and use existing RAM user
module "existing_ram_user" {
  source = "../.."

  # Create resource group
  create_resource_group = true
  resource_group = {
    name         = var.name
    display_name = "Example with Existing RAM User"
    tags = {
      Environment = "Test"
      ManagedBy   = "Terraform"
      Example     = "existing-ram-user"
    }
  }

  # Use existing RAM user
  create_ram_user        = false
  existing_ram_user_name = alicloud_ram_user.existing.name

  # Attach system policy to resource group
  create_policy_attachments = true
  policy_attachments = [
    {
      policy_name    = "AliyunOSSReadOnlyAccess"
      policy_type    = "System"
      principal_name = format("%s@%s.onaliyun.com", alicloud_ram_user.existing.name, data.alicloud_account.this.id)
      principal_type = "IMSUser"
    }
  ]
}
