

resource "aws_vpc" "vpc_daler" {
    cidr_block = "10.0.0.0/16"
    # tags = {
    #     name = "vpc_daler"
    # }

}


resource "aws_subnet" "public_subnet_daler" {
    cidr_block = "10.0.1.0/24"
    # tags = {
    #     name = "public_subnet_daler"
    # }
        vpc_id = "vpc-0db74adb66577aaaa"
}


resource "aws_subnet" "private_subnet_daler" {
    cidr_block = "10.0.2.0/24"
    # tags = {
    #     name = "private_subnet_daler"
    # }
        vpc_id = "vpc-0db74adb66577aaaa"

}


resource "aws_internet_gateway" "internet_gateway_daler" {
    # tags = {
    #     name = "internet_gateway_daler"
    # }

    vpc_id = "vpc-0db74adb66577aaaa"
}
 

resource "aws_route_table" "route_tb_public_daler" {
    # tags = {
    #     name = "route_tb_public_daler"
    # }
    vpc_id  = "vpc-0db74adb66577aaaa"

}


resource "aws_route_table" "route_tb_private_daler" {
    # tags = {
    #     name = "route_tb_private_daler"
    # }
    vpc_id = "vpc-0db74adb66577aaaa"

}