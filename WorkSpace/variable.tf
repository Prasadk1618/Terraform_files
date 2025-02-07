variable "my_region" {
   type = string
   default = "ap-south-1"
}

variable "my_ami"  {
   type     = string
   default  = "ami-00bb6a80f01f03502"
}

variable "inst_type" {
   type = map
   default = {
     default = "t2.micro"
     dev  = "t2.nano"
     test   = "t2.small"
     prod  =  "t2.medium"
}
}
