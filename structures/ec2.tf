
resource "aws_instance" "myFristEc2UsingTF" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    "Name" = "myFristEc2UsingTF"
  }
}
