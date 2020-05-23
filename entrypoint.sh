#!/bin/bash

USER_ID=${LOCAL_UID:-1001}
GROUP_ID=${LOCAL_GID:-1001}

echo "Starting with UID : $USER_ID, GID: $GROUP_ID"
useradd -u $USER_ID -o -m rbcms
groupmod -g $GROUP_ID rbcms
export HOME=/home/rbcms
mkdir /home/rbcms/

exec /usr/sbin/ruby rbcms "$@"
