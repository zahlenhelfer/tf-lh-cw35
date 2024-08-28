resource "aws_instance" "app_server" {
  count         = var.app_server_count
  ami           = var.ami
  instance_type = var.instance_type
  #security_groups = [aws_security_group.webserver_access.name] - default VPC
  vpc_security_group_ids      = [aws_security_group.webserver_access.id] # custom VPC
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  user_data                   = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Deployed via Terraform</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name         = "App Server ${count.index + 1}"
    KRITIS       = "false"
    Kostenstelle = "4711"
  }
}

resource "aws_security_group" "webserver_access" {
  name        = "webserver_security_group"
  description = "Terraform web security group"
  vpc_id      = module.vpc.vpc_id

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

