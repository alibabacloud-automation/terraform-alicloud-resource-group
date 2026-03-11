output "name" {
  description = "The unique identifier of the resource group"
  value       = var.create_resource_group ? alicloud_resource_manager_resource_group.this[0].resource_group_name : var.resource_group.name
}

output "resource" {
  description = "The full output for the resource group resource"
  value       = var.create_resource_group ? alicloud_resource_manager_resource_group.this[0] : null
}

output "resource_id" {
  description = "The resource ID of the resource group"
  value       = local.resource_group_id
}

output "display_name" {
  description = "The display name of the resource group"
  value       = var.create_resource_group ? alicloud_resource_manager_resource_group.this[0].display_name : null
}

output "account_id" {
  description = "The ID of the Alibaba Cloud account to which the resource group belongs"
  value       = var.create_resource_group ? alicloud_resource_manager_resource_group.this[0].account_id : null
}

output "status" {
  description = "The status of the resource group"
  value       = var.create_resource_group ? alicloud_resource_manager_resource_group.this[0].status : null
}

output "ram_user_name" {
  description = "The name of the RAM user (created or existing)"
  value       = var.create_ram_user ? alicloud_ram_user.this[0].name : var.existing_ram_user_name
}

output "ram_user_id" {
  description = "The ID of the created RAM user"
  value       = var.create_ram_user ? alicloud_ram_user.this[0].id : null
}

output "custom_policies" {
  description = "The created custom Resource Manager policies"
  value       = alicloud_resource_manager_policy.custom
}

output "policy_attachments" {
  description = "The policy attachments to the resource group"
  value       = alicloud_resource_manager_policy_attachment.this
}
