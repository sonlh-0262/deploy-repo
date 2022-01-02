output "instance_public_ip" {
  value = module.ec2-instance.instance_public_ip 
}
  
output "instance_state" {
  value = module.ec2-instance.instance_state 
}
