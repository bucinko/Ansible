

# Prepare Lab environment on AWS using terraform

### Installing prerequisities 
```bash
wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
```

Centos
```bash
sudo yum install unzip -y
```

Ubuntu
```bash
sudo apt-get install unzip -y
```

The unzip Terraform and move to path.


```bash
unzip terraform_0.11.13_linux_amd64.zip
sudo mv terraform /usr/local/bin/
```




### Authentication

Authentication with the AWS-related modules is handled by either specifying your access and secret key as ENV vars,
with environment variables:
```bash
export AWS_ACCESS_KEY_ID='AABBBSABABAB'
export AWS_SECRET_ACCESS_KEY='123123123123123123123'
export AWS_DEFAULT_REGION="eu-west-1"
```

edit ssh public key in terraform variables. We will use it for conection to bastion host :
```bash
ansible-aws-lab/var.tf
```


# Deploy AWS lab using terraform
```bash
terraform init ansible-aws-lab
terraform plan ansible-aws-lab
terraform apply -auto-approve ansible-aws-lab  
```

we will get output similar to this:

Outputs:
```bash
public_dns = [
    ec2-52-19-161-219.eu-west-1.compute.amazonaws.com
]
```

# Connection to bastion host 

Never place your SSH private keys on the bastion instance. Instead, use SSH agent forwarding to connect first to the bastion and from there to other instances in private subnets. This lets you keep your SSH private key just on your computer.
If you are using Putty on Windows. Use forwarding option for private key  on Putty

```bash
  eval `ssh-agent`
  ssh-add
  #verify added key
  ssh-add -l
```

After the key is added to your keychain, you can connect to the bastion instance with SSH using the –A option. 
```bash
 ssh   -A  ubuntu@ec2-52-19-161-219.eu-west-1.compute.amazonaws.com
```


# Prepare ansible on Bastion host

```bash
 sudo apt update -y
 sudo apt install ansible -y
```


