variable "ingress_ports" {
  type    = list(number)
  default = [1, 2, 3, 4]
}

resource "aws_security_group" "myTestSG" {
  name = "MyTestSG"

  dynamic "ingress" {
    for_each = var.ingress_ports
    iterator = ingressPort
    content {
      from_port   = ingressPort.value
      to_port     = ingressPort.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}
