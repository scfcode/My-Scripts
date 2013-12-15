#! /bin/ksh

export OLDCOUNT=`grep COUNT $1 | awk '{print $3}'`
export NEWCOUNT=`expr $OLDCOUNT + 1`

read CNAME?"Enter Customer Name: "
read ESCID?"Enter Escalation ID: "
read SDATE?"Enter Start Date: "
read EDATE?"Enter End Date  : "

export CNAME
export ESCID
export SDATE
export EDATE

$HOME/bin/newescrow.sh <$1
