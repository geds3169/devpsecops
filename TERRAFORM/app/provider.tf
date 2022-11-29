terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~>2.9.11"
    }
    vault = {
      source = "hashicorp/vault"
      version = "3.6.0"
    }
  }
}

provider "vault" {
  address = var.vault_url
  skip_tls_verify = true
  token = "$env:VAULT_TOKEN"
}

data "vault_generic_secret" "proxmox" {
  path = "proxmox/creds"
}

provider "proxmox" {
  pm_api_url      = var.proxmox_api_url
  pm_api_token_id = data.vault_generic_secret.proxmox_secret.data["pm_id"]
  pm_api_token_secret = data.vault_generic_secret.proxmox_secret.data["pm_key"]
  pm_tls_insecure = true
}
