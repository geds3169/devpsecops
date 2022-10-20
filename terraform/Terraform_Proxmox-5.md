## 

---

<h2 align="center">
Un peu de théorie
</h2>

---

</br>

### Quelques exemple de fichier ressource (template)

</br>

**Source:** [Telmate LLC (github.com)](https://github.com/Telmate)

</br>

**Cloudinit_exemple.tf**

```json
provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://proxmox-server01.example.com:8006/api2/json"
    pm_password = "secret"
    pm_user = "terraform-prov@pve"
    pm_otp = ""
}

resource "proxmox_vm_qemu" "cloudinit-test" {
    name = "terraform-test-vm"
    desc = "A test for using terraform and cloudinit"

    # Node name has to be the same name as within the cluster
    # this might not include the FQDN
    target_node = "proxmox-server02"

    # The destination resource pool for the new VM
    pool = "pool0"

    # The template name to clone this vm from
    clone = "linux-cloudinit-template"

    # Activate QEMU agent for this VM
    agent = 1

    os_type = "cloud-init"
    cores = 2
    sockets = 1
    vcpus = 0
    cpu = "host"
    memory = 2048
    scsihw = "lsi"

    # Setup the disk
    disk {
        size = 32
        type = "virtio"
        storage = "ceph-storage-pool"
        storage_type = "rbd"
        iothread = 1
        ssd = 1
        discard = "on"
    }

    # Setup the network interface and assign a vlan tag: 256
    network {
        model = "virtio"
        bridge = "vmbr0"
        tag = 256
    }

    # Setup the ip address using cloud-init.
    # Keep in mind to use the CIDR notation for the ip.
    ipconfig0 = "ip=192.168.10.20/24,gw=192.168.10.1"

    sshkeys = <<EOF
    ssh-rsa 9182739187293817293817293871== user@pc
    EOF
}
```

</br>

**lxc_exemple.tf**

```json
provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://proxmox.org/api2/json"
    pm_password = "supersecret"
    pm_user = "terraform-prov@pve"
    pm_otp = ""
}

resource "proxmox_lxc" "lxc-test" {
    features {
        nesting = true
    }
    hostname = "terraform-new-container"
    network {
        name = "eth0"
        bridge = "vmbr0"
        ip = "dhcp"
        ip6 = "dhcp"
    }
    ostemplate = "shared:vztmpl/centos-7-default_20171212_amd64.tar.xz"
    password = "rootroot"
    pool = "terraform"
    target_node = "node-01"
    unprivileged = true
}
```

</br>

**pxe_exemple.tf**

```json
terraform {
  required_version = ">= 1.1.0"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">= 2.9.5"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://proxmox01.example.com:8006/api2/json"
    pm_password = "password"
    pm_user = "root@pam"
    pm_otp = ""
}

resource "proxmox_vm_qemu" "pxe-example" {
    name                      = "pxe-example"
    desc                      = "A test VM for PXE boot mode."
# PXE option enables the network boot feature
    pxe                       = true
# unless your PXE installed system includes the Agent in the installed
# OS, do not use this, especially for PXE boot VMs
    agent                     = 0
    automatic_reboot          = true
    balloon                   = 0
    bios                      = "seabios"
# boot order MUST include network, this is enforced in the Provider
# Optinally, setting a disk first means that PXE will be used first boot
# and future boots will run off the disk
    boot                      = "order=net0;scsi0"
    cores                     = 2
    cpu                       = "host"
    define_connection_info    = true
    force_create              = false
    hotplug                   = "network,disk,usb"
    kvm                       = true
    memory                    = 2048
    numa                      = false
    onboot                    = false
    oncreate                  = true
    os_type                   = "Linux 5.x - 2.6 Kernel"
    qemu_os                   = "l26"
    scsihw                    = "virtio-scsi-pci"
    sockets                   = 1
    tablet                    = true
    target_node               = "test"
    vcpus                     = 0

    disk {
        backup       = 0
        cache        = "none"
        discard      = "on"
        iothread     = 1
        mbps         = 0
        mbps_rd      = 0
        mbps_rd_max  = 0
        mbps_wr      = 0
        mbps_wr_max  = 0
        replicate    = 0
        size         = "32G"
        ssd          = 1
        storage      = "local-lvm"
        type         = "scsi"
    }

    network {
        bridge    = "vmbr0"
        firewall  = false
        link_down = false
        model     = "e1000"
    }
}
```

</br>

**vagrant_exemple.tf**

```json
terraform {
  required_version = ">= 0.14"
  required_providers {
    proxmox = {
        source = "telmate/proxmox"
    }
  }
}

# Using proxmox from a vagrant e.g. https://github.com/rgl/proxmox-ve
provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://10.10.10.2:8006/api2/json"
    pm_user = "root@pam"
    pm_password = "vagrant"
}

resource "proxmox_vm_qemu" "example" {
    name = "servy-mcserverface"
    desc = "A test for using terraform and vagrant"
    target_node = "pve"
}
```
