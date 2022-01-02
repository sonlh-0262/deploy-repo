provider "aws" {
  region = var.aws_region 
}

module "ec2-instance" {
  source = "./modules/ec2-instance"
  
  aws_subnet_id = module.vpc.subnet_id
}
  
module "ebs" {
  source = "./modules/ebs" 
}
  
module "vpc" {
  source = "./modules/vpc" 
}
  
resource "aws_volume_attachment" "name1" {
  device_name = var.volume_device_name1
  volume_id = module.ebs.ebs_volume_name_1
  instance_id = module.ec2-instance.instance_id
}
    
resource "aws_volume_attachment" "name2" {
  device_name = var.volume_device_name2
  volume_id = module.ebs.ebs_volume_name_2
  instance_id = module.ec2-instance.instance_id
}
