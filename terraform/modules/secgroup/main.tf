
# --- security groups ---
resource "openstack_networking_secgroup_v2" "public_secgroup" {
  name        = "secgroup-${var.project}-${var.environment}"
  description = "Managed by Terraform! Security group for ${var.project} project"
}

# Allow SSH from my IP
resource "openstack_networking_secgroup_rule_v2" "allow_myip_ssh" {
  description       = "myIP-SSH"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.my_public_ip
  security_group_id = openstack_networking_secgroup_v2.public_secgroup.id
}

# Allow SSH from uniza IP
resource "openstack_networking_secgroup_rule_v2" "allow_unizaip_ssh" {
  description       = "unizaIP-SSH"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.ip_prefix
  security_group_id = openstack_networking_secgroup_v2.public_secgroup.id
}

# Allow ICMP http from my IP
resource "openstack_networking_secgroup_rule_v2" "allow_myip_icmp" {
  description       = "myIP-ICMP"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = var.my_public_ip
  security_group_id = openstack_networking_secgroup_v2.public_secgroup.id
}

# Allow ICMP http from UNIZA IP
resource "openstack_networking_secgroup_rule_v2" "allow_unizaip_icmp" {
  description       = "myIP-ICMP"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = var.ip_prefix
  security_group_id = openstack_networking_secgroup_v2.public_secgroup.id
}

# Allow HTTP from any IP
resource "openstack_networking_secgroup_rule_v2" "allow_public_http" {
  description       = "anyIP-HTTP"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.public_secgroup.id
}
