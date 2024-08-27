resource "aws_instance" "app_server" {
  count         = 1
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name         = "App Server ${count.index + 1}"
    KRITIS       = "false"
    Kostenstelle = "4711"
  }
}
