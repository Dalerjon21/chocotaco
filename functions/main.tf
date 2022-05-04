
# locals {
#   regions = [ "us-east-1" , "us-east-2" , "us-west-1" , "us-west-2" ]
#   av-zones = [ "us-east-1a" , "us-east-2a" , "us-west-1a" , "us-west-2a" ]
#   cidrs = [ "10.0.0.0/16" , "10.0.1.0/16" , "10.0.2.0/16" , "10.0.3.0/16" ]
# }


# output "regions" {
#   value = local.regions
# }


# output "av-zones" {
#   value = local.av-zones
# }


# output "cidr-block" {
#   value = local.cidrs
# }


# locals {
#   user = [ "admin" , "developer" , "devops" , "architect" ]
# }


# variable "user-name" {
#   type = list(any)
#   default = [ "david" , "tom" , "roman" , "daler" , "jerry" , "kim" , "john" ]
# }


# resource "aws_iam_user" "name1" {
#   count = length(var.user-name)
#   name = element(var.user-name, count.index)
# }


# output "list-length" {
#   value = length(var.user-name)
# }


# resource "aws_default_vpc" "name" {
#    tags = {
#      "Name" = "default-vpc"
#      cidr_blocks = "10.1.0.0/16"
#    }
# }

# locals {
#   map = {
#       "HTTPS" = {
#           port = 443,
#           cidr_blocks = ["10.2.0.0/16"]
#       }
#        "HTTP" = {
#            port = 80,
#            cidr_blocks = ["20.0.0.0/24"]
#       }
#        "SSH" = {
#            port = 22,
#            cidr_blocks = ["10.0.1.0/24"]
#       }
#   }
# }

# resource "aws_security_group" "allow_tls1" {
#   name        = "allow_tls2"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_default_vpc.name.id
  
#   dynamic "ingress" {
#      for_each = local.map
#      content { 
#        description      = ingress.key
#        from_port        = ingress.value.port
#        to_port          = ingress.value.port
#        protocol         = "tcp"
#        cidr_blocks      = ["0.0.0.0/0"]
#    }
#  }

# ingress {
#     description      = "HTTP"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

# ingress {
#     description      = "SSH"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

# ingress {
#     description      = "DNS"
#     from_port        = 53
#     to_port          = 53
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

# ingress {
#     description      = "RDP"
#     from_port        = 33
#     to_port          = 33
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

# ingress {
#     description      = "SQL"
#     from_port        = 1433
#     to_port          = 1433
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }


#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }



# variable "tags" {
#   type = map
#   default = {
#     "Name" = "database-server"
#     "ENV" = "PROD"
#     "PATCHING" = "Linux"
#     "Owner" = "Daler"
#     "CreatedBy" = "Terraform"
#   }
# }

# output "merge_tags" {
#   value = merge("${var.tags}", {DEPARTMENT = "Finance"}, {DEPARTMENT = "Bitcoin"}) 
# }


# output "look_up" {
#   value = lookup(var.tags, "user", "some_user_name")
# }


data "aws_caller_identity" "current" {}


locals {
  account_id = data.aws_caller_identity.current.account_id
}


output "account_id" {
  value = local.account_id
}


resource "aws_s3_bucket" "test_bucket" {
  bucket = "test-bucket-${local.account_id}"
}


