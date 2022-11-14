#URL Vault Hashicorp VM
variable "vault_addr" {
  type    = string
  default = "http://192.168.99.11:8200"
}

#URL API PROXMOX 
variable "proxmox_api_url" {
  description = "The URL for the Proxmox API."
  type        = string
  default     = "https://proxmox3169.web-connectivity.fr:8006/api2/json"
}

#Key you use to unlock your Hashicorp Vault"
# Not used, because the vault is not supposed to be stopped
# To implement it https://developer.hashicorp.com/vault/tutorials/auto-unseal/autounseal-transit
variable "vault_key" {
  description = "Token vault authentication"
  type        = string
  default     = "../creds/vault_token"
}

#The path to your secrets
variable "vault_path" {
  description = "The path to your secrets"
  default     = "auth/approle/role/proxmox"
}

#The SSH Private Key
variable "private_key" {
  default = "The Private Key you want to use to connect"
}



variable "vault_token" {
  type    = string
  shared_credentials_file = "%USERPROFILE%/.vault/credentials"
}
