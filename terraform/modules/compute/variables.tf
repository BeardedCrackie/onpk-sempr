variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "secgroups" {
  type = list(string)
}

variable "flavor_name" {
  type = string
  default = "ONPK_small"
}

variable "key_pair_name" {
  type = string
}

variable "user_data" {
  type = string
}

# Default: ext-net (public network -> instance is connected to the public internet)
variable "network_name" {
  type    = string
  default = "ext-net"
}

variable "image_id" {
  type = string
  default = "0fc1152a-4037-4d89-a22a-60f477e2eba0"
}