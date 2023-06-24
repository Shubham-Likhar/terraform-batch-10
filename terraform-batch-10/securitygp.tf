resource "aws_security_group" "test1" {
  name = "sest1"

  dynamic "ingress" {
    for_each = var.port
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
egress {
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
}

  tags = {
    Name = "terraform-sg-1"
  }
}


