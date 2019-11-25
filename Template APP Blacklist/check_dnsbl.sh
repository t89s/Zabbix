#!/usr/bin/env bash

blstatus=0
if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    IP=$1
else
    IP=$(host -t a $1 | grep addre | awk '{print $4}')
fi
r_ip=$(echo $IP|awk -F"." '{for(i=NF;i>0;i--) printf i!=1?$i".":"%s",$i}')
result=$(dig +short $r_ip.$2)

if [ ! -z "$result" ]
then
	blstatus=1
fi

echo $blstatus
