#!/bin/bash

_dir="$(dirname "$0")"

source "$_dir/config.sh"

# Create TXT record
CREATE_DOMAIN="_acme-challenge"
RESULT=$(curl -s -X POST "https://$ISPMGR:1500/ispmgr" \
  -d "authinfo=$USER:$PASS&out=sjson&func=domain.record.edit&elid=&plid=$CERTBOT_DOMAIN&name=$CREATE_DOMAIN&ttl=3600&rtype=txt&value=$CERTBOT_VALIDATION&sok=ok")

# Sleep to make sure the change has time to propagate over to DNS
sleep 1

echo $RESULT
