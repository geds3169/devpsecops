#URL API VAULT
variable "vault_url" {
  description = "The URL for the Vault."
  type        = string
  default     = "http://192.168.99.11:8200"
}

#URL API PROXMOX 
variable "proxmox_api_url" {
  description = "The URL for the Proxmox API."
  type        = string
  default     = "https://proxmox3169.web-connectivity.fr:8006/api2/json"
}

variable "proxmox_host" {
  description = "The proxmox node"
  type        = string
  default     = "https://proxmox3169.web-connectivity.fr:8006"  
}

#The SSH Private Key
#variable "private_key" {
#  default = "The Private Key you want to use to connect"
#}
