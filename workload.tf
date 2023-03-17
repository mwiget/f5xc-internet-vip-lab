module "wl-eu-north-1" {
  source            = "./aws"
  #  for_each          = {for subnet in local.tgw_spoke_subnets.subnets:  subnet.subnet_name => subnet if "us-west-2" == substr(subnet.availability_zone,0,9)}
  #  appdir            = "main-app"
  #  app               = "mainapp"
  #  traffic           = true
  # fqdn              = var.fqdn
  # deployment        = var.deployment
  site_name         = format("%s-workload", var.project_prefix)
  subnet_id         = module.ce-eu-north-1.f5xc_aws_vpc.workload_subnet_ids[0]
  vpc_id            = module.ce-eu-north-1.f5xc_aws_vpc.vpc_id
  security_group_id = module.ce-eu-north-1.f5xc_aws_vpc.security_group_ids[0]
  instance_type     = "t3.nano"
  ssh_public_key    = var.ssh_public_key
  owner_tag         = "m.wiget@f5.com"
  providers         = {
    aws             = aws.eu-north-1
  }
}

output "instances" {
  value = [ module.wl-eu-north-1 ]
}
