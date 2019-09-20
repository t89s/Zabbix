# Requirement : 

- Install jq

<code bash>apt install jq</code>

  Zabbix must be able to read pem files

<code>-rw-r----- 1 root zabbix 7149 Sep 10 13:31 xxx.pem</code>

  Zabbix must be able to read haproxy configuration files

<code>-rw-r----- 1 root zabbix 10351 Sep 10 13:34 /etc/haproxy/haproxy.cfg</code>

# Install template
	
- Put haproxy_ssl.sh in /etc/zabbix/scripts

- Put userparameter_haproxy_ssl.conf in /etc/zabbix//zabbix_agentd.conf.d/
- Restart zabbix-agent 

<code bash>service zabbix-agent restart</code>

 - Add template to host
