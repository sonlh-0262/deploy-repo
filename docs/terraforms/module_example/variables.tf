variable "aws_region" {
  type = string 
}

variable "ami_name" {
  type = string 
}

variable "instance_count" {
  type = number 
}  

variable "req_public_ip" {
  type = bool
}

variable "instance_type" {
  type = string 
}  

variable "aws_instance_name" {
  type = string 
}

variable "sec_group_id" {
  type = list(string) 
}  

variable "subnet_id" {
  type = string 
}
