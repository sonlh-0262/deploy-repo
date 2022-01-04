resource "aws_instance" "example_ec2" {
  ami = var.ami_string
  instance_type = var.instance_type
  availability_zone = var.aws_instance_azs
  subnet_id = var.aws_subnet_id
  associate_public_ip_address = true
  tags = {
    Name = var.aws_instance_name 
  }
}
