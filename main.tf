resource "proxmox_vm_qemu" "ubuntu-tf-k8s-master" {
  count             = 1
  name              = "ubuntu-tf-k8s-master-0"
  target_node       = "your-proxmox-hostname"

  clone             = "ubuntu-k8s-18.04-master-node-packer-template-node02-fenrirdevops"

  cores             = 4
  sockets           = "1"
  cpu               = "host"
  memory            = 4096
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"

  disk {
    ssd             = 1
    size            = "40G"
    type            = "scsi"
    storage         = "local-lvm"
    iothread = 0
  }

  network {
    model           = "virtio"
    bridge          = "vmbr0"
  }

  lifecycle {
    ignore_changes  = [
      network
    ]
  }

 ipconfig0         = "ip=desired-ip-address/cidr,gw=your-gateway-address"
 nameserver        = "your-local-dns-ip-address"
}

