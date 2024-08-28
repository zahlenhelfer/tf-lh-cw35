resource "aws_instance" "app_server" {
  count         = var.app_server_count
  ami           = var.ami
  instance_type = var.instance_type
  #security_groups = [aws_security_group.webserver_access.name] - default VPC
  vpc_security_group_ids = [aws_security_group.webserver_access.id] # custom VPC
  subnet_id              = aws_subnet.public.id

  tags = {
    Name         = "App Server ${count.index + 1}"
    KRITIS       = "false"
    Kostenstelle = "4711"
  }
}

resource "aws_security_group" "webserver_access" {
  name        = "webserver_security_group"
  description = "Terraform web security group"
  vpc_id      = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.ports
    content {
      description = "Regel ${ingress.key}"
      from_port   = ingress.value.port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

}

