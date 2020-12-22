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

variable "ami" {
  type = map(string)
  default = {
    "ap-southeast-2" = "ami-09f765d333a8ebb4b"
    "ap-southeast-3" = "ami-THAT-DOES-NOT-EXISTS"
    "ap-southeast-4" = "ami-THAT-DOES-NOT-EXISTS"
  }
}

locals {
  time = timestamp()
}

variable "region" {
  type    = string
  default = "ap-southeast-2"
}
variable "tags" {
  type    = list(string)
  default = ["YellowInstance", "RedInstance", "Green", "Blue"]
}
resource "aws_key_pair" "login_key_pair" {
  key_name   = "login-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "MyInstance" {
  ami           = lookup(var.ami, var.region, "SOME-DEFAULT_VALUE")
  instance_type = "t2.micro"
  key_name      = aws_key_pair.login_key_pair.key_name
  count         = 2
  tags = {
    "Name" = element(var.tags, count.index)
  }
}

output "timestamp" {
  value = local.time
}
