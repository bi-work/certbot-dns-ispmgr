#!/bin/bash

_dir="$(dirname "$0")"

source "$_dir/config.sh"

# Strip only the top domain to get the zone id
DOMAIN=$(expr match "$CERTBOT_DOMAIN" '.*\.\(.*\..*\)')

# Remove the challenge TXT record from the zone
DOMAIN_ID="_acme-challenge.$DOMAIN. TXT $CERTBOT_VALIDATION"
RESULT=$(curl -s -X POST "https://$DNSMGR:1500/dnsmgr" \
     -d "authinfo=$USER:$PASS&out=sjson&func=domain.record.delete&elid=DOMAIN_ID&plid=$DOMAIN")
echo $RESULT
