resource "aws_instance" "dev" {
  ami = var.ami.id
  subnet_id = var.subnet.id
  instance_type = var.instance_type
  tags = {
    "Name" = "web-server"
  }
}


variable "subnet_id" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}