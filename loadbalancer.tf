resource "volterra_healthcheck" "hc" {
  depends_on  = [module.namespace.namespace]
  name      = format("%s-workload-hc", var.project_prefix)
  namespace = module.namespace.namespace["name"]

  http_health_check {
    use_origin_server_name = true
    path                   = "/"
  }
  healthy_threshold   = 1
  interval            = 15
  timeout             = 1
  unhealthy_threshold = 2
}

resource "volterra_origin_pool" "workload" {
  depends_on             = [module.wl-eu-north-1, module.namespace.namespace]
  name                   = format("%s-workload", var.project_prefix)
  namespace              = module.namespace.namespace["name"]
  endpoint_selection     = "DISTRIBUTED"
  loadbalancer_algorithm = "LB_OVERRIDE"
  port                   = 80
  no_tls                 = true

  origin_servers {
    private_ip {
      inside_network = true
      ip             = module.wl-eu-north-1.instance.private_ip
      site_locator {
        site {
          namespace = "system"
          name      = format("%s-ce1", var.project_prefix)
        }
      }
    }
  }

  healthcheck {
    name = volterra_healthcheck.hc.name
  }
}

resource "volterra_http_loadbalancer" "site1" {
  depends_on    = [volterra_origin_pool.workload]
  name          = format("%s-ce1", var.project_prefix)
  namespace     = module.namespace.namespace["name"]
  no_challenge  = true
  domains       = [var.domain]

  disable_rate_limit              = true
  service_policies_from_namespace = true
  disable_waf                     = true
  source_ip_stickiness            = true

  advertise_custom {
    advertise_where {
      port = 80
      site {
        network = "SITE_NETWORK_OUTSIDE_WITH_INTERNET_VIP"
        site {
          name      = format("%s-ce1", var.project_prefix)
          namespace = "system"
        }
      }
    }
  }

  default_route_pools {
    pool {
      name = volterra_origin_pool.workload.name
    }
    weight   = 1
    priority = 1
  }

  http {
    dns_volterra_managed = false
    port                 = 80
  }

}


output "origin_pool" {
  value = resource.volterra_origin_pool.workload
}
output "http_loadbalancer1" {
  value = resource.volterra_http_loadbalancer.site1
}
output "health_check" {
  value = resource.volterra_healthcheck.hc
}
