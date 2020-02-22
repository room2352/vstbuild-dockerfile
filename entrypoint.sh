#!/usr/bin/env sh

CONTAINER_UID=${LOCAL_UID:=2001}
CONTAINER_GID=${LOCAL_GID:=2001}

echo "Run as UID: $CONTAINER_UID, GID: $CONTAINER_GID"
useradd -u $CONTAINER_UID -o -m user
groupmod -g $CONTAINER_GID user

export HOME=/home/user

exec /usr/sbin/gosu user "$@"
