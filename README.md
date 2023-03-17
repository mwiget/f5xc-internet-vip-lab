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
$ ./validate.sh
host ves-io-vip-6559-31a017349d125b15.elb.eu-north-1.amazonaws.com
ves-io-vip-6559-31a017349d125b15.elb.eu-north-1.amazonaws.com has address 13.50.216.78

curl -H Host:vip.mwlabs.net http://ves-io-vip-6559-31a017349d125b15.elb.eu-north-1.amazonaws.com ...

================================================
 ___ ___   ___                    _
| __| __| |   \ ___ _ __  ___    /_\  _ __ _ __
| _||__ \ | |) / -_) '  \/ _ \  / _ \| '_ \ '_ \
|_| |___/ |___/\___|_|_|_\___/ /_/ \_\ .__/ .__/
                                      |_|  |_|
================================================

      Node Name: F5 Docker vLab
     Short Name: eb32dbbd6e71

      Server IP: 10.88.0.2
    Server Port: 80

      Client IP: 172.16.32.83
    Client Port: 51203

Client Protocol: HTTP
 Request Method: GET
    Request URI: /

    host_header: vip.mwlabs.net
     user-agent: curl/7.86.0
x-forwarded-for: 212.51.142.48
```

## Helper scripts

- list_sites.sh queries terraform output and returns public and private IPs of the F5 XC CE and workload instance
- validate.sh extracts CNAME of the CE's AWS NLB and sends a curl request using the HOST settings matching the loadbalancer.tf config
