#!/bin/bash
CNAME=$(terraform output -raw cname)
echo "host $CNAME"
host $CNAME
echo ""
echo curl -H Host:vip.mwlabs.net http://$CNAME ...
echo ""
curl -H Host:vip.mwlabs.net http://$CNAME
echo ""
echo curl -H Host:vip.mwlabs.net http://$CNAME:8080 ...
echo ""
curl -H Host:vip.mwlabs.net http://$CNAME:8080
