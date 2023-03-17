#!/bin/bash
CNAME=$(terraform output -raw cname)
echo curl -H Host:vip.mwlabs.net http://$CNAME ...
echo ""
curl -H Host:vip.mwlabs.net http://$CNAME
