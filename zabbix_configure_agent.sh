
#!/bin/bash

if [[ -z "$zabbix_private_floatingIp" ]]; then
  echo "private_floatingIp trying with private"
  if [[ -z "$zabbix_private" ]]; then
    echo "private is required"
    exit 1
  else
    export MONITORING_IP=$zabbix_private
  fi
else
  export MONITORING_IP=$zabbix_private_floatingIp  
fi

echo "Installing zabbix-agent for server at $MONITORING_IP"
sudo apt-get install -y zabbix-agent
sudo sed -i -e "s/ServerActive=127.0.0.1/ServerActive=$MONITORING_IP:10051/g" -e "s/Server=127.0.0.1/Server=$MONITORING_IP/g" -e "s/Hostname=Zabbix server/#Hostname=/g" /etc/zabbix/zabbix_agentd.conf
sudo service zabbix-agent restart
echo "finished installing zabbix-agent!"
