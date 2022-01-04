# Frontend Load Balancer

module "application_alb" {
  source = "./modules/aws_alb"
  environment = "demo"
  aws_lb_name = "application-alb"
  aws_lb_internal = false
  aws_lb_type = "application"
  subnets = module.mgmt-subnet.public_subnet_ids
  security_group_ids = [aws_security_group.allow_http_ssh.id]  
}
  
module "aws_application_target_group" {
  source = "./modules/aws_lb_target_group"
  aws_lb_target_group_name = "demo-application-tg"
  aws_lb_target_group_port = "80"
  aws_lb_target_group_protocol = "HTTP"
  aws_vpc_id = module.vpc.vpc_id
}
  
module "aws_application_listener" {
  source = "./modules/aws_lb_listener"
  aws_lb_arn = module.application_alb.aws_lb_arn
  aws_lb_listener_port = "80"
  aws_lb_listener_protocol = "HTTP"
  aws_lb_listener_df_action_type = "forward"
  aws_target_group_arn = module.aws_application_target_group.aws_target_group_arn
}

module "aws_frontend_listener_rule" {
  source = "./modules/aws_lb_listener_rule"
  aws_listener_arn = module.aws_application_listener.aws_lb_listener_arn
  priority = 100
  aws_listener_rule_type = "forward"
  aws_target_group_arn = module.aws_application_target_group.aws_target_group_arn
  aws_listener_rule_values = ["/*"]
}
    
module "aws_vm1_target_group_attachment" {
  source = "./modules/aws_lb_target_group_attachment"
  aws_target_group_arn = module.aws_application_target_group.aws_target_group_arn
  target_instance_id = module.vm1_instance.instance_id
  aws_lb_target_group_attachment_port = "80"
}
    
module "aws_vm2_target_group_attachment" {
  source = "./modules/aws_lb_target_group_attachment"
  aws_target_group_arn = module.aws_application_target_group.aws_target_group_arn
  target_instance_id = module.vm2_instance.instance_id
  aws_lb_target_group_attachment_port = "80"
}
