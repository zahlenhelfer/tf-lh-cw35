resource "aws_instance" "app_server" {
  count         = var.app_server_count
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name         = "App Server ${count.index + 1}"
    KRITIS       = "false"
    Kostenstelle = "4711"
  }
}

resource "aws_security_group" "webserver_access" {
  name        = "webserver_security_group"
  description = "Terraform web security group"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
