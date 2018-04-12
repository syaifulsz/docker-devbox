#!/bin/bash

cp /var/docker/nginx/sites-enabled/*.conf /etc/nginx/sites-enabled \
&& cp -r /var/docker/nginx/conf-stacks /etc/nginx/conf-stacks

# start common service
service php7.1-fpm restart
service memcached restart
nginx -g "daemon off;"
