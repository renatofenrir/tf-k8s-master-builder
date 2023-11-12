# tf-k8s-master-builder

This setup will builds a k8s master node on Proxmox using Terraform.

It clones a template previously built on your Proxmox cluster/host with Packer.

If you haven't yet provisioned templates on Proxmox, please have a look on the following repos:

https://github.com/renatofenrir/ubuntu-k8s-master-node-packer-template

OR

https://github.com/renatofenrir/ubuntu-k8s-worker-node-packer-template


If you already have templates created on your Proxmox cluster/host, you can:

1. From your localhost or anywhere else (that is located on the same network as your Proxmox infrastructure):

```
$ terraform init (this will install Telmate/proxmox provider, version 2.9.14)
```

2. Double-check wether you're satisfied with the upcoming changes or not:

```
$ terrform plan
```

3. And finally..

```
$ terraform apply
```

Once the apply has been completed, your k8s master node will be provisioned.

It is also worth mentioning that this repo also includes a Gitlab pipeline file that pretty much streamlines the process,
so that you can keep track of your kubernetes infrastructure on CI, in case you have a self-hosted Gitlab instance deployed
somewhere on your infrastructure.



Tested with Terraform version v1.4.6.