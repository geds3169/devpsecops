## 

---

<h2 align="center">
Méthodologie applicative
</h2>

---

</br>

### Mise en place

</br>

**Windows création d'un répertoire nommé `Terraform` dans:**

`C:` ou `C:\Program Files (x86)`.

> - [ ] Téléchargement de l'executable [Downloads | Terraform by HashiCorp](https://www.terraform.io/downloads)
> 
> - [ ] Extraire le contenu de l'archive dans le répertoire `Terraform`.
> 
> - [ ] supprimer l'archive.

</br>

- **Ajouter la variable d'environnement:**
  
  > - [ ] [WINDOWS] + [r]
  > 
  > - [ ] copier et coller: `sysdm.cpl`
  > 
  > - [ ] Sélectionner `Paramêtres systèmes avancés` puis `Variables d'environnement...`
  > 
  > - [ ] Dans la partie haute `Variables utilisatereur pour <utilisateur>`, effectuer un double click de souris sur `Path`.
  > 
  > - [ ] Sélectionner `Nouveau` et `Parcourir` rechercher le répertoire `Terraform`, valider par `OK`.

</br>

- **Test Ouvrir un `Shell` et renseigner le chemin du répertoire `Terraform`:**
  
  `CMD` ou `PowerShell`:
  
  > - [ ] `cd C:\Terraform` ou `C:\Program Files (x86)\Terraform\`, ou adapter à l'emplacement.
  > - [ ] `terraform -version` (Retourne la version de Terraform).

  `MobaXterm`:

> - [ ] `cd /drive/c/Terraform` ou `cd /drives/c/"Program Files (x86)"/Terraform/`, ou adapter à l'emplacement.
> - [ ] `terraform -version` (Retourne la version de Terraform).

</br>
</br>

**Linux création d'un répertoire dans le** `/home/<user>` **et installation du binaire.**

- <u>Linux 1</u> (**Debian** family ):
  
  > - [ ] `mkdir Terraform` (création du répertoire de travail)
  > 
  > - [ ] `cd Terraform` (On va dans le dossier de destination)
  > 
  > - [ ] `curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -` (ajout de la clé du repo).
  > 
  > - [ ] `sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"` (ajout du repository officiel).
  > 
  > - [ ] `sudo apt update` (mise à jour des repository ).
  > 
  > - [ ] `sudo apt install` terraform (installation du binaire).

</br>

- <u>Linux 2</u> (**RHEL** family ):
  
  > - [ ] `mkdir Terraform` (création du répertoire de travail)
  > 
  > - [ ] `cd Terraform` (On va dans le dossier de destination)
  > 
  > - [ ] `sudo yum install -y yum-utils`
  > 
  > - [ ] `sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/$release/hashicorp.repo`
  > 
  > - [ ] `sudo yum update`
  > 
  > - [ ] `sudo yum install terraform`

</br>

- Test Linux 1 & 2:
  
  > - [ ] `terraform version` (Retourne la version de Terraform)
