resource "oci_core_instance" "Linux-VM" {
  count               = var.create_linux_instance ? 1 : 0
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = var.instance_display_name
  shape               = "VM.Standard.E2.1.Micro"

  create_vnic_details {
    assign_public_ip       = true
    display_name           = var.instance_display_name
    nsg_ids                = []
    skip_source_dest_check = "false"
    subnet_id              = var.create_new_vcn ? oci_core_subnet.public_subnet.*.id[0] : var.public_subnet_id
  }

  metadata = {
    ssh_authorized_keys = tls_private_key.ssh_key.public_key_openssh
  }

  launch_options {
    boot_volume_type                    = "PARAVIRTUALIZED"
    firmware                            = "UEFI_64"
    is_consistent_volume_naming_enabled = "true"
    is_pv_encryption_in_transit_enabled = "true"
    network_type                        = "PARAVIRTUALIZED"
    remote_data_volume_type             = "PARAVIRTUALIZED"
  }

  source_details {
    source_id   = var.linux_image_ocid
    source_type = "image"
  }

  preserve_boot_volume = false
}
