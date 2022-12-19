output "instance_name" {
  value = "${openstack_compute_instance_v2.instance.*.name}"
}

output "instance_ipv4_address" {
  value = "${openstack_compute_instance_v2.instance.access_ip_v4}"
}

output "ssh_command" {
  value = "ssh -i ${abspath(".")}/${var.key_pair_name}.pem ${local.image.ubuntu.os_username}@${openstack_compute_instance_v2.instance.access_ip_v4}"
}
