#!/bin/bash
# Version 1.0

cd /var/www/html
swish-e -f /opt/pod/abes-swish-e-docker/indexTout.swish-e -c /opt/pod/abes-swish-e-docker/swishTout.conf
echo "indexation tout terminee"
swish-e -f /opt/pod/abes-swish-e-docker/indexCatalogage.swish-e -c /opt/pod/abes-swish-e-docker/swishCatalogage.conf
echo "indexation catalogage terminee"
swish-e -f /opt/pod/abes-swish-e-docker/indexManuels.swish-e -c /opt/pod/abes-swish-e-docker/swishPourManuels.conf
echo "indexation manuels terminee"