
//connections.tf

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "eu-west-1"
}


resource "aws_key_pair" "deployer" {
  key_name   = "myAwskey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgae6f1UC2FbcLU3UkCQfYFa6U87r+D/E4T1VeVJcsnI3GCMETEvhVoQQQwfX5BUezMTk0F2lg4ilwnUi6vt2N7nkb74dVWTUWrQ8mbPDARhkwWwVie7L706BOv8ZGv+VLJYo9I+AC0d0CF6/v3kn1Gy96WGyUNcUeiF/cUGR3M3GZvzCqnGMnXQA8hYd+Jh9sR6V50p33PexlO0yTvySRaiAPil2i5Pc4DMhi7r6m/tYh7GLpDF/23IBT4AQwyffMww3oWLxG9Jeyue9j1YpHN60EBNDbKK6JQCshYkqcqZBNHt25Q4ezh7T5GUKwGjiRA7w5sSGtF6p1cDy3WPe1 root@tester1.example.com"
}

//servers.tf
resource "aws_instance" "test-ec2-instance" {
  ami = "${var.ami_id}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
tags {
    Name = "vm1"
  }
subnet_id = "${aws_subnet.subnet-uno.id}"
}


resource "aws_eip" "ip-test-env" {
  instance = "${aws_instance.test-ec2-instance.id}"
  vpc      = true
}


resource "aws_instance" "test-ec2-instance1" {
  ami = "${var.ami_id}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
tags {
    Name = "vm2"
  }
subnet_id = "${aws_subnet.subnet-uno.id}"
}

resource "aws_network_interface" "test-ec2-instance1-nic" {
  subnet_id = "${aws_subnet.subnet-uno.id}"
  private_ips = ["10.0.0.100"]
  tags {
    Name = "instance1-nic"
  }
}


