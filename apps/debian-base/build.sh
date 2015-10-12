#!/bin/bash
#. `dirname $0`/spacecamp

. bin/spacecamp

# defines image localed in /var/lib/spacecamp
FROM debian_test

#ID nginx $base_version

RUN pacman -S --noconfirm nginx
rm -Rf $root/etc/nginx
cp -R etc/nginx $root/etc/nginx

ENABLE nginx
CMD /usr/bin/nginx -g "daemon off; error_log stderr info;"
