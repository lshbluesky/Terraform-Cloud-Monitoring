terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 7.15.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.1.0"
    }

    local = {
      source  = "hashicorp/local"
      version = ">= 2.5.3"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_id
  user_ocid        = var.user_id
  fingerprint      = var.api_fingerprint
  private_key_path = var.api_private_key_path
  region           = var.region
}
