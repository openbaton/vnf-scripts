#!/bin/bash

if [ -z ${HAPROXY_CONF_FILE+x} ]; then 
  echo "HAPROXY_CONF_FILE is unset";
  HAPROXY_CONF_FILE="/etc/haproxy/haproxy.cfg"
else 
  echo "HAPROXY_CONF_FILE is set to '$HAPROXY_CONF_FILE'";
fi

echo "The dependency to delete is: $removing_private"

sed -i "/$removing_private/d" $HAPROXY_CONF_FILE

echo "updated configuration file"
cat  $HAPROXY_CONF_FILE
