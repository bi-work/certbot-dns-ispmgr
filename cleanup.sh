#!/bin/bash

_dir="$(dirname "$0")"

source "$_dir/config.sh"

# Remove the challenge TXT record from the zone
DOMAIN_ID="_acme-challenge.$CERTBOT_DOMAIN. TXT  $CERTBOT_VALIDATION"
RESULT=$(curl -s -X POST "https://$ISPMGR:1500/ispmgr" \
  -d "authinfo=$USER:$PASS&out=sjson&func=domain.record.delete&elid=$DOMAIN_ID&plid=$CERTBOT_DOMAIN")

echo $RESULT
