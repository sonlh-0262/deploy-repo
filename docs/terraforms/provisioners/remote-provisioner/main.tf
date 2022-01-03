provider "aws" {
  region = var.aws_region 
}

resource "aws_key_pair" "custom_pair" {
  key_name = "exampleykey"
  # this terraform.pub is generated with ssh-keygen
  public_key = file("./terraform.pub")
}

resource "aws_instance" "example" {
  key_name = aws_key_pair.custom_pair.key_name
  
  ami = data.aws_ami.ubuntu.id
  vpc_security_group_ids = data.aws_security_groups.sec_group.ids
  subnet_id = tolist(data.aws_subnet_ids.example.ids)[0]
  
  associate_public_ip_address = var.req_public_ip
  instance_type = var.instance_type
  tags = {
    Name = var.aws_instance_name 
  }
  
  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("./terraform")
    host = self.public_ip
  }
  
  provisioner "remote-exec" {
    inline = [
      "touch text.txt",
      "echo Hello world > text.txt"
    ]  
  }
}
