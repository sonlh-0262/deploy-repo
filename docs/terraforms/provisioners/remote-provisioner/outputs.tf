output "instance_public_ip" {
  value = aws_instance.example.public_ip 
}

output "instance_state" {
  value = aws_instance.example.instance_state 
}

output "instance_security_groups" {
  value = data.aws_security_groups.sec_group.ids 
}

output "instance_subnet_id" {
  value = tolist(data.aws_subnet_ids.example.ids)[0] 
}
