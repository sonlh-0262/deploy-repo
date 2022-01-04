data "aws_route53_zone" "selected" {
  name = "domain.com" 
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name = "lb.${data.aws_route53_zone.selected.name}"
  type = "A"
  
  alias {
    name = module.application_alb.dns_name
    zone_id = module.application_alb.zone_id
    evaluate_target_health = true
  }
}
