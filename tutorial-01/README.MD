
#Ansible tutorial: Inventory

Before continuing, you need an inventory file. The default place for such a
file is  `/etc/ansible/hosts`. However, you can configure ansible to look
somewhere else, use an environment variable (`ANSIBLE_HOSTS`), or use the `-i`
flag in ansible commands an provide the inventory path.


We've created an inventory file for you in the directory that looks like this:

```bash
host0 ansible_host=         ansible_user=aws-user
host1 ansible_host=         ansible_user=aws-user
host2 ansible_host=         ansible_user=aws-user
```

`ansible_host` is a special _variable_ that sets the IP ansible will use when
trying to connect to this host.

`ansible_user` is another special _variable_ that tells ansible to
connect as this user when using ssh.

## Testing
Now that ansible is installed, let's check everything works properly.

```
ansible -m ping all -i tutorial-01/hosts
```


Continue to next step in directory [tutorial-02]