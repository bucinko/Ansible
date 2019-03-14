module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24" ]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}


module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "2.7.0"
  name        = "example"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp","all-icmp"]
  egress_rules        = ["all-all"]
}


resource "aws_key_pair" "deployer" {
  key_name   = "myAwskey"
  public_key = "${var.public_key}"
}



module "ec2_vm1" {
  private_ip = "10.0.1.100"
  source =  "terraform-aws-modules/ec2-instance/aws"
  instance_type = "${var.instance_type}"
  name = "vm1"
  key_name               =   "${aws_key_pair.deployer.key_name}"
  ami = "${var.ami_id}"
  associate_public_ip_address = false
  subnet_id = "${element(module.vpc.private_subnets, 0)}"
  instance_count         = 1
  vpc_security_group_ids      = ["${module.security_group.this_security_group_id}"]
}

module "ec2_vm2" {
  private_ip = "10.0.1.110"
  source =  "terraform-aws-modules/ec2-instance/aws"
  instance_type = "${var.instance_type}"
  name = "vm2"
  key_name               =   "${aws_key_pair.deployer.key_name}"
  ami = "${var.ami_id}"
  associate_public_ip_address = false
  subnet_id = "${element(module.vpc.private_subnets, 0)}"
  instance_count         = 1
  vpc_security_group_ids      = ["${module.security_group.this_security_group_id}"]
}




module "ec2_vm3" {
  private_ip = "10.0.1.120"
  source =  "terraform-aws-modules/ec2-instance/aws"
  instance_type = "${var.instance_type}"
  name = "vm3"
  key_name               =   "${aws_key_pair.deployer.key_name}"
  ami = "${var.ami_id}"
  associate_public_ip_address = false
  subnet_id = "${element(module.vpc.private_subnets, 0)}"
  instance_count         = 1
  vpc_security_group_ids      = ["${module.security_group.this_security_group_id}"]
}


module "bastion" {
  source =  "terraform-aws-modules/ec2-instance/aws"
  instance_type = "${var.instance_type}"
  name = "bastion"
  ami = "${var.ami_id}"
  key_name          =  "${aws_key_pair.deployer.key_name}"
  associate_public_ip_address = true
  subnet_id = "${element(module.vpc.public_subnets, 1)}"
  instance_count         = 1
  vpc_security_group_ids      = ["${module.security_group.this_security_group_id}"]


}














