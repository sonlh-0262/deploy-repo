data "aws_ami" "ubuntu" {
  most_recent = true
  
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
}

data "aws_security_groups" "test" {
  filter {
    name = "group-name"
    values = ["*default*"]
  }
}
