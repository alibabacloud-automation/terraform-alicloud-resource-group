output "resource_group_id" {
  description = "The ID of the created resource group"
  value       = module.complete.resource_id
}

output "resource_group_name" {
  description = "The name of the created resource group"
  value       = module.complete.name
}

output "ram_user_name" {
  description = "The name of the created RAM user"
  value       = module.complete.ram_user_name
}

output "ram_user_id" {
  description = "The ID of the created RAM user"
  value       = module.complete.ram_user_id
}

output "custom_policies" {
  description = "The created custom policies"
  value       = module.complete.custom_policies
}

output "policy_attachments" {
  description = "The policy attachments"
  value       = module.complete.policy_attachments
}
