

//network.tf
resource "aws_vpc" "test-env" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
    Name = "test-env"
  }
}



//subnets.tf
resource "aws_subnet" "subnet-uno" {
  cidr_block = "${cidrsubnet(aws_vpc.test-env.cidr_block, 8, 8)}"
  vpc_id = "${aws_vpc.test-env.id}"
  availability_zone = "eu-west-1a"
}



//gateways.tf
resource "aws_internet_gateway" "test-env-gw" {
  vpc_id = "${aws_vpc.test-env.id}"
tags {
    Name = "test-env-gw"
  }
}

