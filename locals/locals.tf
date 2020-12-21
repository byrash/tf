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

locals {
  common_tags = {
    env = "Prod"
    ou  = "finance"
  }
}

resource "aws_instance" "test_instance" {
  ami           = "ami-09f765d333a8ebb4b"
  instance_type = "t2.micro"
  tags          = local.common_tags
}
