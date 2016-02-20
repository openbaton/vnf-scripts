#!/bin/bash

if [ -z ${HAPROXY_CONF_FILE+x} ]; then 
  echo "HAPROXY_CONF_FILE is unset";
  HAPROXY_CONF_FILE="/etc/haproxy/haproxy.cfg"
else 
  echo "HAPROXY_CONF_FILE is set to '$HAPROXY_CONF_FILE'";
fi

if [ -z ${NODE_NAME+x} ]; then 
  echo "NODE_NAME is unset";
  NODE_NAME="node-$(( $RANDOM % 1000 + 1 ))"
else 
  echo "NODE_NAME is set to '$NODE_NAME'";
fi

echo "    server $NODE_NAME $elastic_private:80 check" >>  $HAPROXY_CONF_FILE


echo "updated configuration file"
cat  $HAPROXY_CONF_FILE

sudo service haproxy restart
