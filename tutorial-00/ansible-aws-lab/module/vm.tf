
//connections.tf

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "eu-west-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "myAwskey"
  public_key = "${var.public_key}"
}


//servers.tf
#resource "aws_instance" "vm-bastion" {
#  ami = "${var.ami_id}"
#  instance_type = "t2.micro"
#  key_name = "${aws_key_pair.deployer.key_name}"
#  security_groups = ["${aws_security_group.ingress-all-test.id}"]
#tags {
#    Name = "vm1"
#  }
#subnet_id = "${aws_subnet.subnet-uno.id}"
#}


#resource "aws_eip" "ip-test-env" {
#  instance = "${aws_instance.test-ec2-instance.id}"
#  vpc      = true
#}


resource "aws_instance" "vm1" {
  ami = "${var.ami_id}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
tags {
    Name = "vm1"
  }
subnet_id = "${aws_subnet.subnet-uno.id}"
primary_network_interface_id = "${aws_network_interface.vm1-nic.id}"

}

resource "aws_network_interface" "vm1-nic" {
  subnet_id = "${aws_subnet.subnet-uno.id}"
  private_ips = ["${var.private_ip}"]
  tags {
    Name = "vm1-nic"
  }
}


