output "resource_group_id" {
  description = "The ID of the created resource group"
  value       = module.existing_ram_user.resource_id
}

output "resource_group_name" {
  description = "The name of the created resource group"
  value       = module.existing_ram_user.name
}

output "existing_ram_user_id" {
  description = "The ID of the existing RAM user (created for testing)"
  value       = alicloud_ram_user.existing.id
}

output "ram_user_name" {
  description = "The name of the existing RAM user"
  value       = module.existing_ram_user.ram_user_name
}

output "policy_attachments" {
  description = "The policy attachments"
  value       = module.existing_ram_user.policy_attachments
}
