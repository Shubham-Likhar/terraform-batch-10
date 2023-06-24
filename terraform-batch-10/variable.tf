variable "ami" {
  type    = string
  default = "ami-0430580de6244e02e"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "port" {
  type    = list(string)
  default = [22, 80, 443, 3306, 8080, 8087,8081,5432]
}
#port = [22,80,443,3306,8080,8087]