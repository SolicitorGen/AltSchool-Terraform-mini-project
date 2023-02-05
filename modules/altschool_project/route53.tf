resource "aws_route53_zone" "public_hosted_zone" {
  name = "kennethkafeero.me"
}

resource "aws_route53_record" "terraform-test" {
  zone_id = aws_route53_zone.public_hosted_zone.zone_id
  name    = "terraform-test.kennethkafeero.me"
  type    = "A"
  ttl     = "30"
  records = aws_eip.lb-public.*.public_ip
}
