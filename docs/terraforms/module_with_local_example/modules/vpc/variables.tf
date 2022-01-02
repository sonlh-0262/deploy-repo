variable "vpc_cidr" {
  default = "10.20.0.0/16" 
}

variable "aws_vpc_name" {
  type = string
  default = "Demo_VPC"
}

variable "subnets_cidr" {
  type = list(string)
  default = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "azs" {
  type = list(string)
  default = ["us-west-2a", "us-west-2b"]
}

variable "aws_igw_name" {
  type = string
  default = "Demo_igw"
}

variable "aws_rt_name" {
  type = string
  default = "Demo_rt"
}
