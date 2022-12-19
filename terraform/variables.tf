# --- root/variables.tf ---

variable "user_name" {
  type = string
}
variable "password" {
  type = string
}
variable "tenant_name" {
  type = string
}

variable "flavor_name" {
  type = string
  default = "ONPK_large"
}

variable "environment" {
  type    = string
  default = "dev"
}
