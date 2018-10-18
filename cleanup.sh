#!/bin/bash

_dir="$(dirname "$0")"

source "$_dir/config.sh"

# Remove the challenge TXT record from the zone
CREATE_DOMAIN="_acme-challenge.$CERTBOT_DOMAIN"
RESULT=$(curl -s -X POST "https://$DNSMGR:1500/dnsmgr" \
     -d "authinfo=$USER:$PASS&out=sjson&func=domain.record.delete&elid=$CERTBOT_DOMAIN%20TXT%20%20$CERTBOT_VALIDATION&plid=$CERTBOT_DOMAIN")
echo $RESULT
