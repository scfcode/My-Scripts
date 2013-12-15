#!/bin/bash -xv
pwd
cd $HOME
#
pwd
RSYNC=/usr/bin/rsync
SSH=/usr/bin/ssh
KEY=$HOME/.ssh/thishost-rsync-key
RUSER=scfitch
RHOST=jpsescf.us.oracle.com
RPATH=/home/scfitch/htdocs/docs/vp/
LPATH=/Users/stephenfitch/Data/Work/root/vptmp/
RRSYN="--rsync-path /usr/local/bin/rsync"

$RSYNC -av --size-only $RRSYN -e "$SSH -i $KEY" $RUSER@$RHOST:$RPATH $LPATH &>/tmp/x
