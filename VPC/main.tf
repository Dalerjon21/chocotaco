resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}

# Creating Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Public Subnet"
  }
}

# Creating Subnet
resource "aws_subnet" "private_ubnet" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "Private Subnet"
  }
}

# Creating internet gateway
resource "aws_internet_gateway" "lab_gw" {
  vpc_id = aws_vpc.example.id

  tags = {
    Name = "labmain"
  }
}

# Creating Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-009aba44e7219e77c"
  }

  tags = {
    Name = "Public RT"
  }
}