terraform {
  required_version = "~> 1.5.0"

  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      # version = "~>2.9.10"
    }
    sops = {
      source = "carlpett/sops"
      # version = "~>0.7.1"
    }
  }
}
