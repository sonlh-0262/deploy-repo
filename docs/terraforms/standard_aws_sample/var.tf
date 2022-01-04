variable "aws_region" {
  type = string  
}

variable "aws_public_azs" {
  type = string 
}

variable "aws_cidr_mgmt" {
   
}

variable "secGroupName" {
  type = string 
}

variable "secGroupDescription" {
  type = string 
}

variable "vpc_cidr" {
  type = string
  default = "10.211.0.0/16"
}

variable "vpc_name" {
  type = string
  default = "demo-vpc"
}

variable "internet_gw_name" {
  type = string
  default = "demo-ig"
}

variable "public_rt_name" {
  type = string
  default = "demo-public-route"
}

variable "subnet_name" {
  type = string
  default = "demo-mgmt-subnet"
}
