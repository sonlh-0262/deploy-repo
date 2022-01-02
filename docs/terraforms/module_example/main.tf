provider "aws" {
  region = var.aws_region 
}

module "ec2-instance" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "2.15.0"
  
  ami = var.ami_name
  instance_count = var.instance_count
  associate_public_ip_address = var.req_public_ip
  instance_type = var.instance_type
  name = var.aws_instance_name
  vpc_security_group_ids = var.sec_group_id
  subnet_id = var.subnet_id
}
