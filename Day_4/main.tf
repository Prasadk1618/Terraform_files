terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      version = "~>3.1"
    }
  }
}
variable "my_region" {
   type = string
}
variable "access_key" {
   type = string
}
variable "secret_key" {
   type =string
}
variable "my_ami" {
   type = string
}
variable "inst_type" {
   type = string
}
provider "aws" {
  region = var.my_region
  access_key = var.access_key
  secret_key = var.secret_key
}
resource "aws_instance" "myec2" {

  ami           = var.my_ami
  instance_type = var.inst_type
  vpc_security_group_ids = [aws_security_group.mysg.id]
  count         = 2
  tags = {
    Name = "myinstance ${count.index + 1}"
  }
  key_name = "mytf-key"
}
resource "aws_security_group" "mysg" {
  name   = "my-sg1"
  vpc_id = "vpc-0c33cdc23aa09385b"
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
resource "aws_key_pair" "tf-key-pair" {
    key_name = "mytf-key"
    public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
    algorithm = "RSA"
    rsa_bits  = 4096
}
resource "local_file" "tf-key" {
   content  = tls_private_key.rsa.private_key_pem
  filename = "mytf-key"
}
output "ip" {
value = aws_instance.myec2.public_ip
}
