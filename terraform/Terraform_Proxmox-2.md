 

---

<h2 align="center">
Un peu de théorie
</h2>

---

</br>

### Qu'est-ce que Terraform ?

</br>

Terraform est extrêmement puissant et pratique c'est un IAC « d'infrastructure en tant que code», Open Source, propriété de HashiCorp (celui-là même qui fourni Vagrant.

Il est écrit en langage GO, facilement appréhendable par l'homme, il le utilise le langage HCL *(il utilise le .JSON ou .YAML).*

Il peut être couplé à Ansible, l'outil d'orchestration.

Il permettant de créer, de modifier et de versionner une infrastructure de manière sûre et efficace. Terraform peut gérer différent fournisseurs de services tel que:

</br>

- **Cloud provider**:
  
  - AWS, AZURE (...);
    
    Ressource pour la mise en place d'une infrastructure AWS:
    
    [▷Qu'est-ce qu'Amazon Terraform ? ✔️ lizengo.fr - 【 2022 】](https://lizengo.fr/faq/quest-ce-quamazon-terraform/)

- **On premise**:
  
  - VMware, Proxmox (...).

</br>

Il se base sur des templates pour définir les ressources à créer, Il gère:

- le PXE;

- le lxc;

- le cloudinit;

- vagrant;

- (...)
