#!/bin/bash

/usr/bin/security find-internet-password -a "$SSH_PASSWORD_USER" -s "$SSH_PASSWORD_HOSTNAME" -r "ssh " -g 2>&1 1>/dev/null | cut -d\" -f2
