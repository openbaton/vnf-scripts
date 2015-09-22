#
# usage configure.sh <config_ip> <shard_ip>
#

echo "--------------PREINIT---------------"

export LC_ALL=C

nc -z -w50 localhost 27020
if [ $? -eq 0 ]
then
	        exit 2
fi

mongo --eval "sh.addShard('$ip1:27017')"
mongo --eval sh.enableSharding("test")

echo "--------------DONE---------------"
exit 0
