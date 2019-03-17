
# Ansible tutorial: Ansible playbooks


playbook is  series of ansible commands (tasks), like the ones we used with the ansible CLI tool. These tasks are targeted at a specific set of hosts/groups.

```bash
- hosts: web
  tasks:
    - name: Installs apache web server
      apt:
        pkg: apache2
        state: present
        update_cache: true
```

