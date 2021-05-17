#!/bin/bash

# Renew the certificate
/usr/bin/certbot renew --force-renewal -q
/usr/bin/cat /etc/letsencrypt/live/zeedesigns.co.za/fullchain.pem /etc/letsencrypt/live/zeedesigns.co.za/privkey.pem > /etc/ssl/zeedesigns.co.za/zeedesigns.co.za.pem

# Reload  HAProxy
/usr/sbin/service haproxy reload
