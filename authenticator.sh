#!/bin/bash

_dir="$(dirname "$0")"

source "$_dir/config.sh"

# Strip only the top domain to get the zone id
DOMAIN=$(expr match "$CERTBOT_DOMAIN" '.*\.\(.*\..*\)')
	
# Create TXT record
CREATE_DOMAIN="_acme-challenge"
RECORD_ID=$(curl -s -X POST "https://$DNSMGR:1500/dnsmgr" \
     -d "authinfo=$USER:$PASS&out=sjson&func=domain.record.edit&elid=&plid=$DOMAIN&name=$CREATE_DOMAIN&ttl=3600&rtype=txt&value=$CERTBOT_VALIDATION&sok=ok")

# Sleep to make sure the change has time to propagate over to DNS
sleep 5
