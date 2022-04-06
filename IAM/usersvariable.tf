variable "dev-users" {
  type = list(string)
  default = ["John", "Tom", "David", "Sarah", "Henry", "Thomas", "Freddie", "Alfie", "Theo"]
}

variable "test-users" {
  type = list(string)
  default = ["William", "Theodore", "Archie", "Joshua", "Alexander", "James", "Isaac"]
}

variable "prod-users" {
  type = list(string)
  default = ["Edward", "Lucas", "Tommy", "Finley", "Max", "Logan", "Ethan", "Teddy"]
}

variable "dev-group" {
 type = string
 default = "development"
}

variable "prod-group" {
  type = string
  default = "production"
}

variable "test-group" {
  type = string
  default = "tester"
}