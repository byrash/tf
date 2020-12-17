provider "aws" {
  region  = "ap-southeast-2"
  version = "~> 3.0"
}

resource "aws_instance" "myFristEc2UsingTF" {
  ami           = "ami-09f765d333a8ebb4b"
  instance_type = var.instance_type
  tags = {
    "Name" = "myFristEc2UsingTF"
  }
}

# resource "aws_eip" "eip" {
#   vpc = true
# }

# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = aws_instance.myFristEc2UsingTF.id
#   allocation_id = aws_eip.eip.id
# }
