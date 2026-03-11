locals {
  resource_group_id = var.create_resource_group ? alicloud_resource_manager_resource_group.this[0].id : var.existing_resource_group_id
}

# Create or use existing resource group
resource "alicloud_resource_manager_resource_group" "this" {
  count = var.create_resource_group ? 1 : 0

  resource_group_name = var.resource_group.name
  display_name        = coalesce(var.resource_group.display_name, var.resource_group.name)
  tags                = var.resource_group.tags
}

# Create RAM user if requested
resource "alicloud_ram_user" "this" {
  count = var.create_ram_user ? 1 : 0

  name         = var.ram_user.name
  display_name = var.ram_user.display_name
  mobile       = var.ram_user.mobile
  email        = var.ram_user.email
  comments     = var.ram_user.comments
}

# Create custom Resource Manager policies
resource "alicloud_resource_manager_policy" "custom" {
  for_each = var.create_custom_policies ? { for policy in var.custom_policies : policy.policy_name => policy } : {}

  policy_name     = each.value.policy_name
  policy_document = each.value.policy_document
  description     = each.value.description
}

# Attach policies to the resource group
resource "alicloud_resource_manager_policy_attachment" "this" {
  count = var.create_policy_attachments ? length(var.policy_attachments) : 0

  policy_name       = var.policy_attachments[count.index].policy_name
  policy_type       = var.policy_attachments[count.index].policy_type
  principal_name    = var.policy_attachments[count.index].principal_name
  principal_type    = var.policy_attachments[count.index].principal_type
  resource_group_id = local.resource_group_id

  depends_on = [alicloud_ram_user.this, alicloud_resource_manager_policy.custom]
}
