variable "blueprint_id" {
  type = string
}

variable "name" {
  type = string
  description = "Name: Please use only letters, numbers and _"
  validation {
    condition = strcontains(var.name, "/[^a-zA-Z0-9_]/") == false
    error_message = "The name must only have letters, numbers and _"
  }
  default = "System_Alarm"
}
