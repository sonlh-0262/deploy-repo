resource "aws_security_group" "allow_tls_ssh" {
  name = var.secGroupName
  description = var.secGroupDescription
  vpc_id = data.aws_vpc.default.id
  tags = {
    Name = "Terraform" 
  }
  
  ingress {
    description = "TLS from VPC"
    from_port = 443
    to_port = 443
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
  
  provisioner "local-exec" {
    command = "echo ${aws_security_group.allow_tls_ssh.id} ${aws_security_group.allow_tls_ssh.name} >> securityGroup.txt" 
  }
}
