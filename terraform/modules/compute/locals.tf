# --- compute/locals.tf ---

locals {
  image = {
    ubuntu = {
      name        = "ubuntu_server_20.04_Openstack"
      os_username = "ubuntu"
    }
  }
}
