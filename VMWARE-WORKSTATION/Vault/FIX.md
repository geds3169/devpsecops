<h1 align="center">
Vagrant FIX
</h1>

## Connect to the VM

If you are using VMware Workstation and you have an error with the ssh key try this

```bash
  ssh vagrantIP_VM -i /drives/c/Users/YOUR_NAME/.vagrant.d/insecure_private_key
```

*Replace IP_VM and YOUR_NAME !*

If you have and error with

```bash
vagrant ssh
```

Return

```bash
C:/HashiCorp/Vagrant/embedded/gems/2.3.1/gems/vagrant-2.3.1/lib/vagrant/util/subprocess.rb:160:in `rescue in execute':  (216) (Vagrant::Util::Subprocess::LaunchError)
```

Unfortunately, for the moment I do not have a solution, used the method indicated above to connect

## Clean all vagrant

Run from your prompt (where the vagrant file)

**For Virtualbox**

```bash
vagrant plugin uninstall vagrant-vbguest --local
```

**For vmware desktop / player**

```bash
vagrant plugin uninstall vagrant-vbguest --local
```

## Install plugin

**for virtualbox**

```bash
vagrant plugin install vagrant-vbguest --local
```

or a ***specific version***

Install the Version (14/10/2022)

```bash
vagrant plugin install vagrant-vbguest --plugin-version 0.30.0 --local
```

**Return**

```bash
Installing the 'vagrant-vbguest' plugin. This can take a few minutes...
Installed the plugin 'vagrant-vbguest (0.30.0)'!
```

Update

```bash
vagrant plugin update vagrant-vbguest --local
```

**For vmware desktop / player**

Install

```bash
vagrant plugin install vagrant-vmware-desktop --local
```

Update

```bash
vagrant plugin update vagrant-vmware-desktop --local
```

Reload vagrant

```bash
vagrant reload
```

## Bonus

Update all plugins

```bash
vagrant plugin update $(vagrant plugin list |awk '/^[:alnum:]/i {print $1}')
```

## Install Autocompletion

```bash
vagrant autocomplete install --bash --zsh
```

## Connect to the VM

go to the folder where the vagrant file

```bash
cd /drives/g/VM-VMWARE/Centos
```

## Deploy the VM

```bash
vagrant up
```

or if you use **multiple provider**

```bash
vagrant up --provider virtualbox

#or

vagrant up --provider vmware_desktop
```

## Error

```bash
vagrant destroy

# Retour 
An action 'destroy' was attempted on the machine 'centos',
but another process is already executing an action on the machine.
Vagrant locks each machine for access by only one process at a time.
Please wait until the other Vagrant process finishes modifying this
machine, then try again.
```

ou

```bash
If you believe this message is in error, please check the process
listing for any "ruby" or "vagrant" processes and kill them. Then
try again.
```

**Lancer un Windows PowerShell**

```powershell
Copyright (C) Microsoft Corporation. Tous droits réservés.

Installez la dernière version de PowerShell pour de nouvelles fonctionnalités et améliorations ! https://aka.ms/PSWindows

PS C:\Windows\system32> Get-Process ruby

Handles NPM(K) PM(K) WS(K) CPU(s) Id SI ProcessName

------- ------ ----- ----- ------ -- -- -----------
199      19   121384      81484      54,33  11964   2 ruby
```

et enfin

```powershell
PS C:\Windows\system32> Stop-process 11964
PS C:\Windows\system32> Get-Process ruby
```



Retrouver une adresse depuis vagrant 

[mkuzmin/vagrant-address: Vagrant plugin for obtaining an IP address of a guest machine (github.com)](https://github.com/mkuzmin/vagrant-address)

```bash
vagrant plugin install vagrant-address
```
