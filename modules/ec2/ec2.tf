resource "aws_instance" "MyInstance" {
  instance_type = var.instance_type
  ami           = var.ami_id
  key_name      = "tf"
}
