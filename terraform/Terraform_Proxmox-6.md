## 

---

<h2 align="center">
Méthodologie applicative
</h2>

---

</br>

## Prérequis

</br>

Création manuelle ou en CLI, d'un utilisateur dédié à Terraform via le Web GUI Proxmox (pve account) terraform@pve et création d'un rôle dédié à l'utilisateur terraform ou via le Shell Web GUI ou en SSH ou utiliser un rôle existant.

**Source:** [Docs overview | Telmate/proxmox | Terraform Registry](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs))

```bash
pveum user add terraform@pve --password <password>
pveum role add TerraformRules -privs "VM.Allocate VM.Clone VM.Config.CDROM VM.Config.CPU VM.Config.Cloudinit VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Monitor VM.Audit VM.PowerMgmt Datastore.AllocateSpace Datastore.Audit"
pveum aclmod / -user terraform@pve -role TerraformRules
```

</br>

Si vous souhaitez ajouter un rôle utlérieurement cela est faisable en modifiant le rôle TerraformRules ou encore via la CLI en ajoutant à la ligne précédente le(s) autorisations complémentaire:

```bash
pveum role modify TerraformProv -privs "VM.Allocate VM.Clone VM.Config.CDROM VM.Config.CPU VM.Config.Cloudinit VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Monitor VM.Audit VM.PowerMgmt Datastore.AllocateSpace Datastore.Audit"
```

</br>

Voir rôle complémentaire [User Management - Proxmox VE](https://pve.proxmox.com/wiki/User_Management) **Permission Management**

**Création d'un token** *(optionnel en fonction du choix d'identification)*

[How to deploy VMs in Proxmox with Terraform - Austin's Nerdy Things (austinsnerdythings.com)](https://austinsnerdythings.com/2021/09/01/how-to-deploy-vms-in-proxmox-with-terraform/)

</br>

Source: [Terraform Registry](https://registry.terraform.io/providers/danitso/proxmox/latest/docs)
