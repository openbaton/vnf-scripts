#!/bin/bash

FILE_NAME="file.php"
TEST_FILE="/var/www/html/$FILE_NAME"

if [ -z ${STRESS_SECONDS+x} ]; then
  echo "STRESS_SECONDS is unset";
  STRESS_SECONDS="60"
else
  echo "STRESS_SECONDS is set to '$STRESS_SECONDS'";
fi

if [ -z ${CORES+x} ]; then
  echo "CORES is unset";
  CORES="4"
else
  echo "CORES is set to '$CORES'";
fi

sudo apt-get update
sudo apt-get install apache2 stressapptest -y
sudo apt-get install php5 -y
sudo apt-get install libapache2-mod-php5 -y
sudo /etc/init.d/apache2 restart


echo "<?php" >> $TEST_FILE
echo "header('Content-Type: text/plain');" >> $TEST_FILE
echo 'echo "Server IP: {$_SERVER['SERVER_ADDR']}";' >> $TEST_FILE
echo 'echo "\nClient IP: {$_SERVER['REMOTE_ADDR']}";' >> $TEST_FILE
echo 'echo "\nX-Forwarded-for: {$_SERVER['HTTP_X_FORWARDED_FOR']}\n";' >> $TEST_FILE
echo "shell_exec('stressapptest -C $CORES -s $STRESS_SECONDS');" >> $TEST_FILE
echo "?>" >> $TEST_FILE

cat $TEST_FILE

