terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      version = "~>3.1"
}
}
}
provider "aws" {
   region = "ap-south-1"
}
resource "aws_instance" "myec2" {

     ami = "ami-00bb6a80f01f03502"
     instance_type = "t2.micro"
     vpc_security_group_ids = [aws_security_group.my-sg.id]
     count = 2
     tags= {
        Name = "TFInsta ${count.index+1}"
          }
     key_name = "kubernet"
}
resource "aws_security_group" "my-sg" {
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
}
