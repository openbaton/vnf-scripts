#!/bin/bash

FILE_NAME="file.php"
TEST_FILE="/var/www/html/$FILE_NAME"

SCRIPT_FILE="/tmp/helloworld.sh"

if [ -z ${LOOP1+x} ]; then
echo "LOOP1 is unset";
LOOP1="100"
else
echo "LOOP1 is set to '$LOOP1'";
fi

if [ -z ${LOOP2+x} ]; then
echo "LOOP2 is unset";
LOOP2="1000"
else
echo "LOOP2 is set to '$LOOP2'";
fi
sudo apt-get update
sudo apt-get install apache2 -y
sudo apt-get install php5 -y
sudo apt-get install libapache2-mod-php5 -y
sudo /etc/init.d/apache2 restart

echo '#!/bin/bash' >> $SCRIPT_FILE
echo 'for n in {1..'"$LOOP1"'}; do for i in {1..'"$LOOP2"'}; do md5sum <(echo "HelloWorld"); done & done' >> $SCRIPT_FILE

echo "<?php" >> $TEST_FILE
echo "header('Content-Type: text/plain');" >> $TEST_FILE
echo 'echo "Server IP: {$_SERVER['SERVER_ADDR']}";' >> $TEST_FILE
echo 'echo "\nClient IP: {$_SERVER['REMOTE_ADDR']}";' >> $TEST_FILE
echo 'echo "\nX-Forwarded-for: {$_SERVER['HTTP_X_FORWARDED_FOR']}\n";' >> $TEST_FILE
echo "shell_exec('bash $SCRIPT_FILE');" >> $TEST_FILE
echo "?>" >> $TEST_FILE

cat $TEST_FILE
