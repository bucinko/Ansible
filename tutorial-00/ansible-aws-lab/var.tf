

variable "ami_id" {
 default = "ami-08d658f84a6d84a80"
 //ubuntu ami
}

variable "instance_type" {
 default = "t2.micro"
}


variable "aws_region" {
  
  default = "eu-west-1"
}
 
variable "number_of_instances" {
  default = "2"
}
 
variable "name" {

  default = "vm"
}

variable "key_name" {

  default = "myAwskey"
}

variable "public_key" {

  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgae6f1UC2FbcLU3UkCQfYFa6U87r+D/E4T1VeVJcsnI3GCMETEvhVoQQQwfX5BUezMTk0F2lg4ilwnUi6vt2N7nkb74dVWTUWrQ8mbPDARhkwWwVie7L706BOv8ZGv+VLJYo9I+AC0d0CF6/v3kn1Gy96WGyUNcUeiF/cUGR3M3GZvzCqnGMnXQA8hYd+Jh9sR6V50p33PexlO0yTvySRaiAPil2i5Pc4DMhi7r6m/tYh7GLpDF/23IBT4AQwyffMww3oWLxG9Jeyue9j1YpHN60EBNDbKK6JQCshYkqcqZBNHt25Q4ezh7T5GUKwGjiRA7w5sSGtF6p1cDy3WPe1 root@tester1.example.com"

}

