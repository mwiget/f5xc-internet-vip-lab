data "aws_lb" "internet" {
  depends_on            = [volterra_http_loadbalancer.lb1, volterra_http_loadbalancer.lb2]

  tags = {
    "ves-io-site-name"  = format("%s-ce1", var.project_prefix)
    "ves-io-creator-id" = var.owner_tag
    "ves-io/nlb-type"   = "internet-vip"
  }
}
