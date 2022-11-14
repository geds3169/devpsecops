terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~>2.9.11"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~>2.24.1"
    }
  }
}

provider "vault" {
  address         = var.vault_addr
  skip_tls_verify = true

  # Root Token
  shared_crendtials_file=var.shared_credentials_file
  token = var.vault_token
}

data "vault_generic_secret" "approle" {
  path = var.vault_path

}


provider "proxmox" {
  # Configuration options
  # vault kv get secret/proxmox/proxmox_auth
  pm_api_url      = var.proxmox_api_url
  pm_user         = data.proxmox.proxmox_auth.data["pm_user"]
  pm_password     = data.proxmox.proxmox_auth.data["pm_password"]
  pm_tls_insecure = true
}


# Try curl API request from Proxmox Shell
# vault auth list
# vault read auth/approle/role/proxmox
# vault read auth/approle/role/proxmox/role-id
# vault write -f auth/approle/role/proxmox/secret-id
# vault write auth/approle/login role_id="" secret_id=""

# vault write auth/approle/login role_id="my_role_id_value_here" secret_id="my_secret_id_value_here"
# vault secrets list
# vault login token=mytoken_value_here
# vault kv get secret/proxmox/proxmox_auth
# vault secrets list


# Permet de s'authentifier en tant que proxmox approle
#vault read auth/approle/role/proxmox/role-id
#vault write -f auth/approle/role/proxmox/secret-id
#vault write auth/approle/login role_id=${ROLE_ID} secret_id=${SECRET_ID}

# Me permet de consommet la ressource ($PROMOX_TOKEN est retourné par les commandes supérieures)
#curl -H "X-Vault-Token: $PROXMOX_TOKEN" http://127.0.0.1:8200/v1/secret/proxmox/proxmox_auth | jq .


# AUTH
#curl -X 'POST' \
#  'http://XX.XX.XX.XX:8200/v1/auth/approle/login' \
#  -H 'accept: */*' \
#  -H 'Content-Type: application/json' \
#  -H 'X-Vault-Token: my_token_value_here' \
#  -d '{
#  "role_id": "my_role_id_value_returned_here",
#  "secret_id": "my_secret_id_value_returned_here"
#}'


#curl -X 'GET' \
#  'http://XX.XX.XX.XX:8200/v1/auth/approle/role' \
#  -H 'accept: */*' \
#  -H 'X-Vault-Token: my_token_value_here'

#curl -X 'GET' \
#  'http://XX.XX.XX.XX:8200/v1/auth/approle/role/proxmox' \
#  -H 'accept: */*' \
#  -H 'X-Vault-Token: my_token_value_here'

#curl -X 'GET' \
#  'http://XX.XX.XX.XX:8200/v1/auth/approle/role/proxmox/local-secret-ids' \
#  -H 'accept: */*' \
#  -H 'X-Vault-Token: my_token_value_here'

#curl -X 'GET' \
#  'http://XX.XX.XX.XX:8200/v1/auth/approle/role/proxmox/role-id' \
#  -H 'accept: */*' \
#  -H 'X-Vault-Token: my_token_value_here'

#curl -X 'GET' \
#  'http://XX.XX.XX.XX:8200/v1/secret/proxmox/proxmox_auth' \
#  -H 'accept: */*' \
#  -H 'X-Vault-Token: my_token_value_here'
