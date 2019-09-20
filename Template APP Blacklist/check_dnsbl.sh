#!/usr/bin/env bash
DEBUG="$2"

blstatus=0
IP=$(host -t a $1 | grep addre | awk '{print $4}')
r_ip=$(echo $IP|awk -F"." '{for(i=NF;i>0;i--) printf i!=1?$i".":"%s",$i}')
result=$(dig +short $r_ip.$2)

if [ ! -z "$result" ]
then
	blstatus=1
	if [ ! -z "$DEBUG" ]
	then
		  echo "$server ($IP) is in $rbl with code $result"
	fi
fi

echo $blstatus
