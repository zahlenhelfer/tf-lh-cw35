resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "Mein toller VPC"
  }
}

resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "Public Subnet-1a"
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1b"
  tags = {
    Name = "Public Subnet-1b"
  }
}
