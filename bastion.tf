resource "aws_route" "bastion" {
  route_table_id         = module.ce-eu-north-1.f5xc_aws_vpc.main_route_table_id
  destination_cidr_block = var.bastion_cidr
  gateway_id             = module.ce-eu-north-1.f5xc_aws_vpc.igw_id
}
