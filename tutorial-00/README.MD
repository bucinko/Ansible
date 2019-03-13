

# Prepare Lab environment on AWS

### Installing prerequisities 
```bash
sudo yum install epel-release -y
sudo yum install python-pip -y
#pip install --upgrade pip
sudo pip install boto3 awscli ansible
```


### Authentication

Authentication with the AWS-related modules is handled by either specifying your access and secret key as ENV variables or module arguments.
with environment variables:
```bash
export AWS_ACCESS_KEY_ID='AK123'
export AWS_SECRET_ACCESS_KEY='abc123'
```




