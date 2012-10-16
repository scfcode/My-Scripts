#!/bin/bash -xv
pwd
VTMP=/Users/stephenfitch/Data/Work/root/vptmp/
cd $HOME
pwd
#export SSH_AUTH_SOCK=/tmp/launch-xH3tGo/Listeners
/usr/bin/rsync --rsync-path=/usr/local/bin/rsync -rauvi --delete-after ${VTMP} scfitch@jpsescf.us.oracle.com:/home/scfitch/htdocroot/vp/ &>/tmp/x
