terraform {
  required_providers {
    aws = {
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

variable "is_prod_env" {
  type    = bool
  default = false
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-09f765d333a8ebb4b"
  instance_type = "value"
  count         = var.is_prod_env == true ? 3 : 1
}
