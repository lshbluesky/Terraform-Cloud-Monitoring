resource "oci_core_vcn" "shl-VCN" {
  count          = (var.create_new_vcn) ? 1 : 0
  compartment_id = var.compartment_id

  cidr_block   = var.vcn_cidr_block
  display_name = var.vcn_display_name
  dns_label    = var.vcn_dns_label
}

resource "oci_core_subnet" "private_subnet" {
  count          = (var.create_new_vcn) ? 1 : 0
  cidr_block     = var.private_subnet_cidr_block
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.shl-VCN.*.id[0]

  display_name               = var.private_subnet_display_name
  prohibit_public_ip_on_vnic = var.private_subnet_prohibit_public_ip_on_vnic
}

resource "oci_core_subnet" "public_subnet" {
  count          = (var.create_new_vcn) ? 1 : 0
  cidr_block     = var.public_subnet_cidr_block
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.shl-VCN.*.id[0]

  display_name               = var.public_subnet_display_name
  prohibit_public_ip_on_vnic = var.public_subnet_prohibit_public_ip_on_vnic
  route_table_id             = oci_core_route_table.shl_route_table.*.id[0]
}

resource "oci_core_internet_gateway" "shl_internet_gateway" {
  count          = (var.create_new_vcn) ? 1 : 0
  compartment_id = var.compartment_id
  display_name   = "Internet_GTW_for_${var.vcn_display_name}"
  vcn_id         = oci_core_vcn.shl-VCN.*.id[0]
}

resource "oci_core_route_table" "shl_route_table" {
  count          = (var.create_new_vcn) ? 1 : 0
  compartment_id = var.compartment_id
  display_name   = "shl-Route-Table"
  vcn_id         = oci_core_vcn.shl-VCN.*.id[0]

  route_rules {
    network_entity_id = oci_core_internet_gateway.shl_internet_gateway.*.id[0]
    description       = "Route rule internet access for ${var.vcn_display_name}"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}
