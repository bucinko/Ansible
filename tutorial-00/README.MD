

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

edit ssh public kei in :
```bash
ansible-aws-lab/var.tf
```


Deploy AWS lab using terraform
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

now we can connect to out managment vm:

```bash
 ssh   -i yourPubKeyFile  ubuntu@ec2-52-19-161-219.eu-west-1.compute.amazonaws.com
```



