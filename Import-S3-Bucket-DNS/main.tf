terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      version = "~>3.1"
    }
  }
}

## This Block For Printing The Bucket DNS_Name..!!

provider "aws" {
  region = var.my_region
}

resource "aws_s3_bucket" "bucket" {
   bucket = "teraform-dns-print"
}

## This Block For Import Our Bucket Dns Name In Out Terraform tfstate File..!!

output "bucket-link" {
   value = aws_s3_bucket.bucket.bucket_domain_name
}
