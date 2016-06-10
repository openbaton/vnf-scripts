#!/bin/bash

export LC_ALL=C
export DEBIAN_FRONTEND="noninteractive"

if [[ -z "$zabbix_pwd" ]]; then
  zabbix_pwd=zabbix
fi

if [ -z $mysql_pwd ]; then
  mysql_pwd=root
fi


echo '# Zabbix Application PPA' >> /etc/apt/sources.list
echo 'deb http://ppa.launchpad.net/tbfr/zabbix/ubuntu precise main' >> /etc/apt/sources.list
echo 'deb-src http://ppa.launchpad.net/tbfr/zabbix/ubuntu precise main' >> /etc/apt/sources.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C407E17D5F76A32B

sudo apt-get update

# avoid promt of pwd
export DEBIAN_FRONTEND="noninteractive"

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

sudo apt-get install -y mysql-server-5.6

sudo apt-get install -y zabbix-server-mysql php5-mysql zabbix-frontend-php

echo "" >> /etc/zabbix/zabbix_server.conf
echo "" >> /etc/zabbix/zabbix_server.conf
echo "DBPassword=$zabbix_pwd" >> /etc/zabbix/zabbix_server.conf

cd /usr/share/zabbix-server-mysql/

sudo gunzip *.gz

mysql -u root -proot -e "create user 'zabbix'@'localhost' identified by '$zabbix_pwd';"
mysql -u root -proot -e "create database zabbix;"
mysql -u root -proot -e "grant all privileges on zabbix.* to 'zabbix'@'localhost';flush privileges;"

mysql -u zabbix -p$zabbix_pwd zabbix < schema.sql
mysql -u zabbix -p$zabbix_pwd zabbix < images.sql
mysql -u zabbix -p$zabbix_pwd zabbix < data.sql

sed -i -e "s/post_max_size = 8M/post_max_size = 16M/g" -e "s/max_execution_time = 30/max_execution_time = 300/g" -e "s/max_input_time = 60/max_input_time = 300/g" -e "s/;date.timezone =/date.timezone = UTC/g" /etc/php5/apache2/php.ini

sudo cp /usr/share/doc/zabbix-frontend-php/examples/zabbix.conf.php.example /etc/zabbix/zabbix.conf.php

sed -i -e "s/zabbix_password/zabbix/g" /etc/zabbix/zabbix.conf.php

sudo cp /usr/share/doc/zabbix-frontend-php/examples/apache.conf /etc/apache2/conf-enabled/zabbix.conf

sudo a2enmod alias

sudo service apache2 restart

sed -i -e "s/START=no/START=yes/g" /etc/default/zabbix-server
sudo service zabbix-server restart

mysql -u zabbix -p$zabbix_pwd zabbix -e "update actions set status = 0 where name like '%Auto discovery%';"
