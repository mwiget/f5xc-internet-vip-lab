module "ce-eu-north-1" {
  source                               = "./modules/f5xc/site/aws/vpc"
  f5xc_aws_region                      = "eu-north-1"
  f5xc_aws_vpc_site_name               = format("%s-ce1", var.project_prefix)
  f5xc_api_token                       = var.f5xc_api_token
  f5xc_api_url                         = var.f5xc_api_url
  f5xc_tenant                          = var.f5xc_tenant
  f5xc_namespace                       = "system"
  f5xc_aws_cred                        = var.f5xc_aws_cred
  f5xc_aws_vpc_owner                   = var.owner_tag
  f5xc_aws_default_ce_sw_version       = true
  f5xc_aws_default_ce_os_version       = true
  f5xc_aws_ce_gw_type                  = "multi_nic"
  f5xc_aws_vpc_no_worker_nodes         = false
  ssh_public_key                       = var.ssh_public_key
  f5xc_aws_vpc_use_http_https_port     = true
  f5xc_aws_vpc_use_http_https_port_sli = true
  f5xc_aws_vpc_primary_ipv4            = "172.16.32.0/24"
  f5xc_aws_vpc_enable_internet_vip     = true

  f5xc_aws_vpc_az_nodes = {
    node0 = {
      f5xc_aws_vpc_workload_subnet = "172.16.32.0/26",
      f5xc_aws_vpc_inside_subnet   = "172.16.32.64/26",
      f5xc_aws_vpc_outside_subnet  = "172.16.32.128/26",
      f5xc_aws_vpc_az_name         = "eu-north-1a"
    }
  }

  f5xc_labels = {
    "site-mesh" = var.project_prefix
  }
  providers = {
    aws = aws.eu-north-1
  }
}

