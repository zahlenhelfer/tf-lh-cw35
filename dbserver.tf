resource "aws_instance" "db_server" {
  count                  = var.server_build ? 1 : 0
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.webserver_access.id] # custom VPC
  subnet_id              = aws_subnet.public.id

  tags = {
    Name         = "DB Server"
    KRITIS       = "false"
    Kostenstelle = "4711"
  }
}
