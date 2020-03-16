#! /bin/bash
#

#       ensure we have a clean copy of the original one
#       we will need it when this script runs again
if [ ! -e /etc/hosts0 ]; then
    cp /etc/hosts /etc/hosts0
fi

#       now update /etc/hosts with the latest
cd /tmp
wget http://winhelp2002.mvps.org/hosts.txt
mv /etc/hosts /tmp
mv hosts.txt /etc/hosts
cat /etc/hosts0 >> /etc/hosts

# you should probably crontab this, as they update regulary
# 59 23 * * * /root/update_hosts.sh
