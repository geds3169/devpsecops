## 

---

<h2 align="center">
Un peu de théorie
</h2>

---

</br>

### Structure des fichiers de configuration Terraform

</br>

*Dans cet article nous verrons une approche basique et une approche plus poussé, les bonnes pratiques.*

</br>

**Deux méthodes d'utilisation du provider, par :**

> - Identifiant et mot de passe
> - Un token

</br>

##### Identification par nom d'utilisateur et mot de passe

Afin d'utiliser l'API, le provider doit connaitre certain paramêtres:

> - URL
> - Le nom d'utilisateur
> - Le mot de passe utilisateur

</br>

*Il est cependant recommandé d'utiliser des variables d'environnement pour des questions de sécurité lors de l'utilisation du couple nom d'utilisateur et mot de passe.*

</br>
</br>

**Dans votre Shell il faudra executer les commandes suivantes**

*Méthode non recommandé*

</br>

```bash
export PM_USER="terraform@pve" # à adapter
export PM_PASS="password"    # à adapter
```

</br>

**Note:**

*Il est à noter que ces informations ne seront défini que dans le main.tf, l'utilisation du Vault est plus que conseillé (comme dans Ansible), afin de s'affranchir d'une faille de sécurité et supprimer l'entrée en dur dans les fichiers de configuration.*

</br>

Dans le fichier main.tf il faudra renseigner les instructions suivantes

```json
# main.tf ou provider.tf

provider "proxmox" {
  pm_api_url = "https://proxmox.example.com:8006/api2/json"
}
```

</br>
</br>
</br>

##### Identification par token

</br>

*Méthode recommandé*

</br>

Dans votre Shell executer les commandes suivantes *(Méthode non recommandé)*

```bash
export PM_API_TOKEN_ID="terraform@pve!mytoken" # à adapter
export PM_API_TOKEN_SECRET="afcd9f46-anc1-4d1f-dc12-b90c0787ec11"
```

</br>

```json
# provider.tf ou main.tf

provider "proxmox" {
  pm_api_url = "https://proxmox.example.com:8006/api2/json"
}
```

</br>
</br>
</br>

##### Activer le débogage *(optionnel)*

```json
# provider.tf ou main.tf

provider "proxmox" {
  pm_debug = true
}
```

</br>
</br>
</br>

##### Activer la prise en charge du proxy *(optionnel)*

```json
# provider.tf ou main.tf

provider "proxmox" {
  pm_proxy_server = "http://proxyurl:proxyport"
}
```

</br>
</br>

*A noter que l'utilisation du* `Vault` *est toujours recommandé ou du* `CLI Configuration File`.

</br>

**Source:**

[Docs overview | hashicorp/vault | Terraform Registry](https://registry.terraform.io/providers/hashicorp/vault/latest/docs)

[CLI Configuration | Terraform by HashiCorp](https://www.terraform.io/cli/config/config-file)
