#!/bin/bash
spacecamp=/home/spacecamp/applications/SpaceCamp
. `dirname $0`/spacecamp

camp_number=$1

FROM debian_testing_amd64

ID camp $1

RUN apt-get -y update
cp -R $spacecamp/apps/rkt/bin/* $root/usr/local/bin/
cp -R $spacecamp/apps/etcd/bin/* $root/usr/local/bin/
cp -R $spacecamp/apps/fleet/bin/* $root/usr/local/bin/
mkdir -p $root/root/.ssh
cp $spacecamp/build/pdc/authorized_keys $root/root/.ssh/
chmod 600 $root/root/.ssh/authorized_keys
# copy over unit files

#rm -Rf $root/etc/nginx
#cp -R etc/nginx $root/etc/nginx

ENABLE systemd-networkd
CMD adduser --disabled-password --gecos "" core && adduser --disabled-password --gecos "" testing

