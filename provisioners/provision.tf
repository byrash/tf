
resource "aws_instance" "MyInstance" {
  instance_type = var.instance_type
  ami           = var.ami_id
  key_name      = "tf"

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/Downloads/tf.pem")
      host        = self.public_ip
    }
  }
}
