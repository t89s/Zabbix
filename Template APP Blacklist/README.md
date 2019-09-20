# Template APP Blacklist IP Check

## requirement

 - Debian & CO

<code>apt-get install dnsutils</code>

 - CentOS / RHEL

<code>yum install bind-utils</code>

## Usage : 

The scripts will check the following lists :

  - bl.spamcop.net
  - cbl.abuseat.org
  - b.barracudacentral.org
  - dnsbl.sorbs.net
  - http.dnsbl.sorbs.net 
  - dul.dnsbl.sorbs.net 
  - misc.dnsbl.sorbs.net 
  - smtp.dnsbl.sorbs.net 
  - socks.dnsbl.sorbs.net 
  - spam.dnsbl.sorbs.net 
  - web.dnsbl.sorbs.net 
  - zombie.dnsbl.sorbs.net 
  - dnsbl-1.uceprotect.net 
  - dnsbl-2.uceprotect.net 
  - dnsbl-3.uceprotect.net 
  - bl.spamcannibal.org 
  - psbl.surriel.com 
  - ubl.unsubscore.com 
  - rbl.spamlab.com 
  - dyna.spamrats.com 
  - noptr.spamrats.com 
  - spam.spamrats.com 
  - cbl.anti-spam.org.cn 
  - cdl.anti-spam.org.cn 
  - dnsbl.inps.de 
  - drone.abuse.ch 
  - httpbl.abuse.ch dul.ru 
  - spamrbl.imp.ch 
  - wormrbl.imp.ch 
  - virbl.bit.nl 
  - rbl.suresupport.com 
  - dsn.rfc-ignorant.org 
  - ips.backscatterer.org 
  - spamguard.leadmon.net 
  - opm.tornevall.org 
  - netblock.pedantic.org 
  - black.uribl.com 
  - grey.uribl.com multi.surbl.org 
  - ix.dnsbl.manitu.net 
  - blackholes.mail-abuse.org 
  - rbl-plus.mail-abuse.org 
  - dnsbl.dronebl.org 
  - rbl.interserver.net 
  - query.senderbase.org 
  - bogons.cymru.com

Retourne : 
 - 0 : Not listed
 - 1 : Listed 


## Installation
 - Put the script on the server and / or proxy in /usr/lib/zabbix/externalscripts/

 - Adjust permissions for zabbix : 

<code>chmod 700 /usr/lib/zabbix/externalscripts/check_dnsbl.sh</code>

<code>chown zabbix:zabbix /usr/lib/zabbix/externalscripts/check_dnsbl.sh</code>

 - Install template in Zabbix

 - Add Template in host 

 - Adjust MACRO {$BLACKLISTFQDN} in host
