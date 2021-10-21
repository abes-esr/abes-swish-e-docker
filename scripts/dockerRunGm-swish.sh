#!/bin/bash
# Version 1.0

docker run --restart unless-stopped -d --name gm-swish  \
-p 8080:80  \
-v /var/www/html/guide/html/:/var/www/html/ \
-v /opt/pod/abes-swish-e-docker/swish.cgi:/usr/lib/cgi-bin/swish.cgi \
-v /opt/pod/abes-swish-e-docker/TemplateDefault.pm:/usr/lib/swish-e/perl/SWISH/TemplateDefault.pm \
-v /opt/pod/abes-swish-e-docker/.swishcgi.conf:/usr/lib/cgi-bin/.swishcgi.conf \
-v /opt/pod/abes-swish-e-docker/:/opt/pod/abes-swish-e-docker/ \
abesesr/swish-e-docker:1.1.1
