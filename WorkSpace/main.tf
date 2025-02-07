terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      version = "~>3.1"
    }
  }
}

provider "aws" {
  region = var.my_region
}

resource "aws_instance" "web" {
   ami            = var.my_ami
   instance_type  = lookup (var.inst_type,terraform.workspace)
   tags = {
     Name = "myserver"
   }
}
