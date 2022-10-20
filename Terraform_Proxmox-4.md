## 

---

<h2 align="center">
Un peu de théorie
</h2>

---

</br>

### Les arguments

</br>

**Les arguments suivants sont pris en charge dans le bloc du provider:**

</br>

- `pm_api_url` - (Required; or use environment variable `PM_API_URL`) This is the target Proxmox API endpoint.
- `pm_user` - (Obligatoire ; ou utiliser la variable d'environnement `PM_USER`) L'utilisateur, n'oubliez pas d'inclure le domaine d'authentification tel que terraform@pve .
- `pm_password` - (Facultatif ; sensible ; ou utiliser la variable d'environnement `PM_PASS`) Le mot de passe.
- `pm_api_token_id` - (Facultatif ; ou utiliser la variable d'environnement`PM_API_TOKEN_ID`) Il s'agit del'[API token](https://pve.proxmox.com/pve-docs/pveum-plain.html) que vous avez précédemment créé pour un utilisateur spécifique.
- `pm_api_token_secret` - (Facultatif ; ou utiliser la variable d'environnement `PM_API_TOKEN_SECRET`) Cet uuid est uniquement disponible lors de la création initiale du jeton.
- `pm_otp` - (Facultatif ; ou utiliser la variable d'environnement `PM_OTP`) Le code OTP, 2FA.
- `pm_tls_insecure` - (Facultatif) Désactive la vérification TLS lors de la connexion au serveur proxmox.
- `pm_parallel` - (Facultatif ; valeur par défaut : 4) Processus Proxmox simultanés autorisés (par exemple, la création de ressources).
- `pm_log_enable` - (Facultatif ; valeur par défaut : false) Active la journalisation de débogage, voir la section ci-dessous pour les détails de la journalisation.
- `pm_log_levels` - (Facultatif) Une carte des sources et des niveaux des journaux.
- `pm_log_file` - (Facultatif ; la valeur par défaut est "terraform-plugin-proxmox.log") Si la journalisation est activée, il s'agit du fichier journal dans lequel le fournisseur écrira les journaux.
- `pm_timeout` -(Facultatif ; la valeur par défaut est 300) Valeur du délai d'attente (secondes) pour les appels de l'API proxmox.
- `pm_debug` - (Facultatif ; valeur par défaut : false) Active la sortie verbeuse dans proxmox-api-go.
- `pm_proxy_server` - (Facultatif ; la valeur par défaut est nil) Envoyer l'appel api du fournisseur à un serveur proxy pour faciliter le débogage.

</br>

En outre, on peut définir le `PM_OTP_PROMPT` pour demander le code OTP, 2FA (si nécessaire).

</br>
</br>

Exemple de bloc permettant la sortie de log à placer dans le code suivant dans le bloc provider, pour déboger.

```json
provider "proxmox" {
  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_debug      = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}
```

</br>

Pour désactiver et tout sorties d'erreur stdout/stderr des sous-bibliothèques (proxmox-api-go), supprimer ou commenter `_capturelog`.
