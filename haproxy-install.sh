#!/bin/bash


sudo apt-get update
sudo apt-get install haproxy -y

sed -i s/ENABLED=0/ENABLED=1/ /etc/default/haproxy;

if [ -z ${APP_NAME+x} ]; then 
  echo "APP_NAME is unset";
  APP_NAME="elastic-app"
else 
  echo "APP_NAME is set to '$APP_NAME'"; 
fi

if [ -z ${BALANCE_MODE+x} ]; then 
  echo "BALANCE_MODE is unset";
  BALANCE_MODE="roundrobin"
else 
  echo "BALANCE_MODE is set to '$BALANCE_MODE'";
fi

if [ -z ${HAPROXY_CONF_FILE+x} ]; then 
  echo "HAPROXY_CONF_FILE is unset";
  HAPROXY_CONF_FILE="/etc/haproxy/haproxy.cfg"
else 
  echo "HAPROXY_CONF_FILE is set to '$HAPROXY_CONF_FILE'";
fi

echo "" >>  $HAPROXY_CONF_FILE
echo "listen $APP_NAME 0.0.0.0:80" >>  $HAPROXY_CONF_FILE
echo "    mode http" >>  $HAPROXY_CONF_FILE
echo "    stats enable" >>  $HAPROXY_CONF_FILE
echo "    stats uri /haproxy?stats" >>  $HAPROXY_CONF_FILE
echo "    balance $BALANCE_MODE" >>  $HAPROXY_CONF_FILE
echo "    option httpclose" >>  $HAPROXY_CONF_FILE
echo "    option forwardfor" >>  $HAPROXY_CONF_FILE
