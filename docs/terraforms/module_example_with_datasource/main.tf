provider "aws" {
  region = var.aws_region 
}

module "ec2-instance" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "2.15.0"
  
  ami = data.aws_ami.ubuntu.id
  instance_count = var.instance_count
  associate_public_ip_address = var.req_public_ip
  instance_type = var.instance_type
  name = var.aws_instance_name
  vpc_security_group_ids = data.aws_security_group.test.ids
  subnet_id = var.subnet_id
}
