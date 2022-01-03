data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
  
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }  
  owners = ["xxxxxxxxxxx"]
}

data "aws_security_groups" "sec_group" {
  filter {
    name = "group-name"
    values = ["*default*"]
  }
}

data "aws_vpc" "default" {
  default = true 
}

data "aws_subnet_ids" "example" {
  filter {
    name = "availability-zone"
    values = ["var.availability_zone"]
  }
  vpc_id = data.aws_vpc.default.id
}
