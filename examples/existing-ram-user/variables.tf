variable "name" {
  type        = string
  default     = "tfexamplename"
  description = "The name for the resource group"
}

variable "existing_user" {
  type        = string
  default     = "existing-user-example"
  description = "The name of the existing RAM user"
}
