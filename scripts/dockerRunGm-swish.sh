#!/bin/bash
# Version 1.0

docker run --restart unless-stopped -d --name gm-swish  \
-p 8080:80  \
-v /var/www/html/guide/html/:/var/www/html/ \
-v /opt/guide/data-swish-e/swish.cgi:/usr/lib/cgi-bin/swish.cgi \
-v /opt/guide/data-swish-e/TemplateDefault.pm:/usr/lib/swish-e/perl/SWISH/TemplateDefault.pm \
-v /opt/guide/data-swish-e/.swishcgi.conf:/usr/lib/cgi-bin/.swishcgi.conf \
-v /opt/guide/data-swish-e/:/opt/guide/data-swish-e/ \
abesesr/swish-e-docker:1.1.0
