# output "vpc_id" {
#   value = aws_vpc.Terraform.cidr_block
# }

# output "public_subnet_cidr" {
#   value = aws_subnet.public_subnet.cidr_block
# }

# output "private_subnet_cidr" {
#   value = aws_subnet.private_subnet.arn
# }

# output "greetings" {
#   value = "Hello users"
# }

output "subnet_pub_id" {
  value = aws_subnet.public_subnet.id
}
