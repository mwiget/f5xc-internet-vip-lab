module "namespace" {
  source              = "./modules/f5xc/namespace"
  f5xc_namespace_name = format("%s-lb-op-lab", var.project_prefix)
}
