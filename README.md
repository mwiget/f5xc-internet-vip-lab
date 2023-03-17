# f5xc-internet-vip-lab

Demo lab setup for AWS Internet VIP NLB feature on AWS VPC site.

## Topology

```
                               + - - - - - - - - - - - - - - - - +
+---------+                    |  +-------------+   +---------+  |    +-------------+
| bastion |                       |  AWS NLB    |   |  F5 XC  |       |  workload   |
|  host   |------{ Internet }-----| cname xyz   |---| AWS VPC |-------|   nginx     |
| client  |                       | TCP Port 80 |   |  Node   |       | TCP Port 80 |
+---------+                    |  +-------------+   +---------+  |    +-------------+
                               |    F5 XC AWS VPC Site ns-ce1    |
                               + - - - - - - - - - - - - - - - - +
```

## Deployment

- Copy terraform.tfvars.example and adjust with your credentials
- `terraform apply`
- Initial run with fail with data resource aws_lb returning 0 elements,
  simply rerun `terraform apply` and it will succeed
- Run `validate.sh` on any Internet connected client to test reaching the workload web server via the AWS internet VIP LB of the ce1

```

```
