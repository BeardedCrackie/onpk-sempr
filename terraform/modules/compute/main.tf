# --- compute/main.tf ---


# --- instances ---
resource "random_pet" "pet" {
  length = 1
}

data "openstack_compute_flavor_v2" "flavor_id" {
  name = var.flavor_name
}

# Unable to query images: Get "http://controller:9292... : OpenStack connection error, retries exhausted.
//data "openstack_images_image_v2" "image_id" {
//  name = local.image.ubuntu.name
//}

resource "openstack_compute_instance_v2" "instance"{
  name            = "${var.project}-${var.environment}-${random_pet.pet.id}"
  image_id        = var.image_id
  //image_id        = data.openstack_images_image_v2.image_id.id #Unable to query images: Get "http://controller:9292... : OpenStack connection error, retries exhausted.
  flavor_id      = data.openstack_compute_flavor_v2.flavor_id.id
  key_pair        = var.key_pair_name

  #security_groups = [ "${openstack_networking_secgroup_v2.secgroup_01.id}" ]
  #security_groups = [ var.security_group_id.name ]
  #security_groups = [ openstack_networking_secgroup_v2.secgroup_01.name ]
  security_groups = var.secgroups
  user_data = var.user_data

  network {
    name = var.network_name
  }

}