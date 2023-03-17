output "ce-eu-north-1" {
  value = module.ce-eu-north-1
}
output "internet-vip-lb" {
  value = data.aws_lb.internet
}
output "cname" {
  value = data.aws_lb.internet.dns_name
}
