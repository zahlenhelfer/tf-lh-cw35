resource "aws_instance" "app_server" {
  ami           = "ami-0de02246788e4a354"
  instance_type = "t2.micro"
  tags = {
    Name         = "ExampleAppServerInstance"
    KRITIS       = "false"
    Kostenstelle = "4711"
  }
}
