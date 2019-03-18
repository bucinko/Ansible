
# Ansible tutorial: Talking to nodes

In the previous command, -m ping means "use module ping". It doesn't need any arguments

### Shell module

Shell module lets you execute a shell command on the remote host. Modules that take arguments pass them via -a switch.
We can get disk usage on app01 node with command
```bash
ansible -m shell -a "df -h"   -i 01-inventory/hosts  app01
```

```bash
app01 | SUCCESS | rc=0 >>
udev            1.7G     0  1.7G   0% /dev
/dev/sda1        29G  1.2G   28G   5% /
tmpfs           1.7G     0  1.7G   0% /dev/shm
/dev/sda15      105M  3.6M  101M   4% /boot/efi
/dev/sdb1       6.9G   32M  6.5G   1% /mnt
```


### Get facts about system with setup module
gather more facts about your target servers to organize your playbooks. 
This module provides you the information about the server hardware, network and some of the ansible-related software settings.

```
ansible -m setup   -i 01-inventory/hosts  app01  
```


```bash
app01 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "10.0.100.6"
        ],
        "ansible_all_ipv6_addresses": [
            "fe80::20d:3aff:fe26:6ff8"
        ],
        "ansible_apparmor": {
            "status": "enabled"
        },
        "ansible_architecture": "x86_64",
```

we can filter out memory on host by adding  ```-a 'filter=ansible_memtotal_mb'```

```ansible -m setup -a 'filter=ansible_memtotal_mb'   -i 01-inventory/hosts  app01```

```bash
app01 | SUCCESS => {
    "ansible_facts": {
        "ansible_memtotal_mb": 3439
    },
    "changed": false
```

### More usefull modules

-  SELinux Module -  allow you to configure the SELinux module on linux
-  Mount Module - controls mount points pointed to /etc/fstab
-  User Module  - manage user accounts
-  Git Module - will allow you to manage git checkouts of repositories to deploy software





