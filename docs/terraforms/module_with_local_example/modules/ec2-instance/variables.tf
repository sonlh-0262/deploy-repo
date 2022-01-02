variable "ami_string" {
  type = string
  default = "ami-xxxxx"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "aws_instance_azs" {
  type = string
  default = "us-west-2a"
}

variable "aws_instance_name" {
  type = string
  default = "example-5-module"
}

variable "aws_subnet_id" {
  type = string 
}
