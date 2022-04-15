resource "aws_vpc" "Terraform" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Terraform"
  }
}

# Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.Terraform.id
  cidr_block = var.pub_sub_cidr
  availability_zone = var.av_zones.0

  tags = {
    Name = "Ter-Pub-Sub"
  }
}

# Create Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.Terraform.id
  cidr_block = var.pri_sub_cidr
  availability_zone = var.av_zones.2

  tags = {
    Name = "Ter-Pri-Sub"
  }
}

#Internet Gateway
# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.Terraform.id

#   tags = {
#     Name = "Terraform-GW"
#   }
# }

# # Public route table
# resource "aws_route_table" "Pub-RT" {
#   vpc_id = aws_vpc.Terraform.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }

#   tags = {
#     Name = "Terraform-Pub-RT"
#   }
# }

# # Add tag to the Main Route Table
# resource "aws_default_route_table" "Private-RT" {
#   default_route_table_id = "${aws_vpc.Terraform.default_route_table_id}"

#   tags = {
#     Name = "Terraform-Pri-RT"
#   }
# }

# # Route Table Assoiciation with Public
# resource "aws_route_table_association" "Asso" {
#   subnet_id      = aws_subnet.public_subnet.id
#   route_table_id = aws_route_table.Pub-RT.id
# }

# # Route Table Assoiciation with Private
# resource "aws_route_table_association" "Assoi" {
# #  subnet_id      = "${aws_subnet.private_subnet.id}"
# #  route_table_id = "${aws_route_table.private-RT.id}"

#   subnet_id      = aws_subnet.private_subnet.id 
#   route_table_id = aws_default_route_table.Private-RT.id
# }

