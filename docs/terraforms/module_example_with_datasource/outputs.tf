output "instance_public_ip" {
  value = module.ec2-instance.public_ip 
}
  
output "instance_state" {
  value = module.ec2-instance.instance_state 
}
  
output "instance_security_groups" {
  value = module.ec2-instance.security_groups
}
