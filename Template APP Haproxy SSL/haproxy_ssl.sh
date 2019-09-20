#!/bin/bash

discovers_ssl() {
	CERTLIST=$(egrep 'bind' /etc/haproxy/haproxy.cfg | grep crt | awk -F " " '{print $5}' | grep -v pem | sort | uniq)
	CERTPEM=$(egrep 'bind' /etc/haproxy/haproxy.cfg | grep crt | awk -F " " '{print $5}' | grep pem | sort | uniq)

	if [ -n "$CERTLIST" ]
	then
		CERTLIST=$(cat $CERTLIST)
		CHECK=$(echo  "$CERTPEM\n$CERTLIST")
		CHECK=$(echo "$CHECK" | sed '/^$/d' | sort | uniq)
	else
		CHECK=$(echo "$CERTPEM")
		CHECK=$(echo "$CHECK" | sed '/^$/d' | sort | uniq)
	fi
	echo "$CHECK" |  jq -Rn '{data: [inputs|{"{#CERTFILE}":.}]}'
}

check_ssl() {

	now_epoch=$( date +%s )
	expiry_date=$( echo | openssl x509 -inform pem -in $1 -noout -enddate | cut -d "=" -f 2 )
	expiry_epoch=$( date -d "$expiry_date" +%s)
	expiry_days="$(( ($expiry_epoch - $now_epoch) / (3600 * 24) ))"
	NEW="$NEW $cert $expiry_days"
	echo $NEW

}

if [ -z $1 ]
then
	discovers_ssl
else
	check_ssl $1
fi

