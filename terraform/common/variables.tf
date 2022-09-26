variable "workload" {
  type = string
  validation {
    condition     = can(regex("^[\\w-]+$", var.workload))
    error_message = "Workload group name is not valid."
  }
  default = "mgmt"
}

variable "team_name" {
  type = string
  validation {
    condition     = can(regex("^[\\w-]+$", var.team_name))
    error_message = "Team_name group name is not valid."
  }
  default = "vl"
}

variable "environment" {
  type = string
  validation {
    condition     = can(regex("^[\\w-]+$", var.environment))
    error_message = "Environment group name is not valid."
  }
  default = "dev"
}

variable "location" {
  type = string
  validation {
    condition     = can(regex("^[\\w-]+$", var.location))
    error_message = "Location group name is not valid."
  }
  default = "westeurope"
}

# cr
variable "cr_sku" {
  type = string
  validation {
    condition     = can(regex("^Basic|Premium$", var.cr_sku))
    error_message = "Container Registry sku can be Basic or Premium only."
  }
  default = "Basic"
}

# kv
variable "kv_sku" {
  type = string
  validation {
    condition     = can(regex("^standard|premium$", var.kv_sku))
    error_message = "KV sku can be Standard or Premium only."
  }
  default = "standard"
}