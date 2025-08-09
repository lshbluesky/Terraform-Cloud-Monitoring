variable "api_fingerprint" {
  description = "Fingerprint of OCI API private key for Tenancy"
  type        = string
}

variable "api_private_key_path" {
  description = "Path to OCI API private key used for Tenancy"
  type        = string
}

variable "availability_domain" {
  description = "Availability Domain"
  type        = string
}

variable "tenancy_id" {
  description = "Tenancy ID where to create resources for Tenancy"
  type        = string
}

variable "user_id" {
  description = "User ID that Terraform will use to create resources for Tenancy"
  type        = string
}

variable "region" {
  description = "OCI region where resources will be created for Tenancy"
  type        = string
}

# VCN specific variables
variable "create_new_vcn" {
  description = "Boolean variable to specify whether to create a new VCN or to reuse an existing one."
  type        = bool
}

variable "compartment_id" {
  description = "OCI compartment where resources will be created"
  type        = string
}

variable "vcn_cidr_block" {
  description = "The list of IPv4 CIDR blocks the VCN will use"
  type        = string
}

variable "vcn_display_name" {
  description = "provide a descriptive name for the VCN - this is what you will see displayed in the OCI console"
  type        = string
}

variable "vcn_dns_label" {
  description = "provide a descriptive alphanumeric name for the DNS - this is what you will see displayed in the OCI console"
  type        = string
}

variable "vcn_id" {
  description = "provide your existing VCN OCID if create_new_vcn = false"
  type        = string
}

variable "private_subnet_id" {
  description = "provide existing private subnet OCID"
  type        = string
}

variable "public_subnet_id" {
  description = "provide existing public subnet OCID"
  type        = string
}
