resource "aws_key_pair" "custom_pair" {
  key_name = "examplekey"
  public_key = file("./terraform.pub")
}

resource "aws_security_group" "allow_http_ssh" {
  name = var.secGroupName
  description = var.secGroupDescription
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "Terraform" 
  }
    
  ingress {
    description = "HTTP from VPC"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    
  ingress {
    description = "SSH Access" 
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
  
module "vm1_instance" {
  source = "./modules/aws_ec2instance"
  ami_id = "ami-xxxx"
  aws_subnet_id = module.mgmt-subnet.public_subnet_id
  security_group_ids = [aws_security_group.allow_http_ssh.id]
  keyname = aws_key_pair.custom_pair.key_name
  user_data = <<-EOF
    #!/bin/bash
    sudo yum install epel-release -y
    sudo yum install nginx -y
    sudo chmod 777 /usr/share/doc/HTML/index.html
    sudo echo "This is Demo Server 1" > /usr/share/nginx/html/index.html
    sudo systemctl restart nginx
  EOF
}
  
module "vm2_instance" {
  source = "./modules/aws_ec2instance"
  ami_id = "ami-xxx"
  aws_subnet_id = module.mgmt-subnet.public_subnet_id
  security_group_ids = [aws_security_group.allow_http_ssh.id]
  keyname = aws_key_pair.custom_pair.key_name
  user_data = <<-EOF
    #!/bin/bash
    sudo yum install epel-release -y
    sudo yum install nginx -y
    sudo chmod 777 /usr/share/doc/HTML/index.html
    sudo echo "This is Demo Server 2" > /usr/share/nginx/html/index.html
    sudo systemctl restart nginx
  EOF
}
