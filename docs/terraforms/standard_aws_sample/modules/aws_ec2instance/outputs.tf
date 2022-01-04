output "instance_id" {
  value = aws_instance.example_ec2.id
}

output "instance_public_ip" {
  value = aws_instance.example_ec2.public_ip
}

output "instance_state" {
  value = aws_instance.example_ec2.instance_state
}
