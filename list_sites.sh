#!/bin/bash
terraform output -json| jq -r '.[].value.f5xc_aws_vpc.nodes[]' 2>/dev/null
terraform output -json | jq -r '.instances.value[].instance | { name: .tags.Name, public_ip: .public_ip, private_ip: .private_ip, public_dns: .public_dns, private_dns: .private_dns, id: .id, instance_type: .instance_type  }' | jq -n '.instance |= [inputs]' 
