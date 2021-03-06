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

resource "aws_instance" "myFristEc2UsingTF" {
  ami           = "ami-09f765d333a8ebb4b"
  instance_type = "t2.micro"
  tags = {
    "Name" = "myFristEc2UsingTF"
  }
}
