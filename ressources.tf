resource "aws_instance" "app_server" {
  count         = 2
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name         = "ExampleAppServerInstance"
    KRITIS       = "false"
    Kostenstelle = "4711"
  }
}
