# Create flags
variable "create_resource_group" {
  type        = bool
  default     = true
  description = "Whether to create a new resource group."
}

variable "create_ram_user" {
  type        = bool
  default     = false
  description = "Whether to create a new RAM user."
}

variable "create_custom_policies" {
  type        = bool
  default     = false
  description = "Whether to create custom Resource Manager policies."
}

variable "create_policy_attachments" {
  type        = bool
  default     = false
  description = "Whether to create policy attachments to the resource group."
}

# Existing resource references
variable "existing_resource_group_id" {
  type        = string
  default     = ""
  description = "ID of existing resource group to use when create_resource_group is false."
}

variable "existing_ram_user_name" {
  type        = string
  default     = ""
  description = "Name of existing RAM user to use when create_ram_user is false."
}

# Resource configurations
variable "resource_group" {
  type = object({
    name         = string
    display_name = optional(string)
    tags         = optional(map(string), {})
  })
  description = "Resource group configuration. `name` - The unique identifier (3-50 chars, start with letter). `display_name` - Display name, defaults to name. `tags` - Tags to assign."

  validation {
    condition     = can(regex("^[a-zA-Z][a-zA-Z0-9-]{2,49}$", var.resource_group.name))
    error_message = "The resource group name must be 3 to 50 characters in length, start with a letter, and can only contain letters, digits, and hyphens (-)."
  }
}

variable "ram_user" {
  type = object({
    name         = optional(string)
    display_name = optional(string)
    mobile       = optional(string)
    email        = optional(string)
    comments     = optional(string)
  })
  default     = {}
  description = "RAM user configuration. `name` - Name for new RAM user, defaults to resource group name. `display_name` - Display name. `mobile` - Mobile phone number. `email` - Email address. `comments` - Comments."
}

variable "custom_policies" {
  type = list(object({
    policy_name     = string
    policy_document = string
    description     = optional(string, "")
  }))
  default     = []
  description = "List of custom Resource Manager policies to create."
}

variable "policy_attachments" {
  type = list(object({
    policy_name    = string
    policy_type    = optional(string, "Custom")
    principal_name = string
    principal_type = string
  }))
  default     = []
  description = "List of policy attachments to apply to the resource group. Each attachment should specify policy_name, policy_type (System or Custom), principal_name, and principal_type (IMSUser, IMSGroup, or ServiceRole)."
}
