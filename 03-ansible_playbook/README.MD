
# Ansible tutorial: Ansible playbooks


playbook is  series of ansible commands (tasks), like the ones we used with the ansible CLI tool. These tasks are targeted at a specific set of hosts/groups.

##### Load balancer playbook 

``` hosts``` specifies on which host it will execute

```become: true ``` will execute with sudo

``` tasks```  list of tasks that will be executed . In this case we install nginx using module ```apt```

```bash
- hosts: loadbalancer
  become: true
  tasks:
      - name: install nginx
        apt:
          name: nginx
          state: present
          update_cache: yes
```

we will execute it with command 
``` 
ansible-playbook  -i hosts loadbalancer.yml
```

##### web server playbook

in this playbook we will install apache and other components using loop control ```with_items```

 

