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
   access_key = "*******************"
   secret_key = "*******************"
}
resource "aws_instance" "myec2" {

     ami = "ami-00bb6a80f01f03502"
     instance_type = "t2.micro"
     key_name      = "kubernet"   // Key Pair File Added Here 
     security_groups = [aws_security_group.allow_ssh.name]  // here Resource mention ex Port No 
     count = 2   // How much resource are you want to create Mention Here
     tags= { 
      Name = "TFInsta ${count.index+1}"  // In Tag We Can Mention Here which name we want to give in our resource 
}
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH from anywhere (Change to your IP for security)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allows all outbound traffic
  }
}
