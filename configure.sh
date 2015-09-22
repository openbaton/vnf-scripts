#
# usage configure.sh <config_ip> <shard_ip>
#

echo "--------------PREINIT---------------"

export LC_ALL=C

nc -z -w50 $1 27019
if [ $? -eq 0 ]
then
	exit 1
fi

mongos --configdb @@config:ip1@@:27019 --port 27020 &

nc -z -w50 localhost 27020
if [ $? -eq 0 ]
then
	        exit 2
fi

mongo --eval "sh.addShard('$2:27017')"
mongo --eval sh.enableSharding("test")

echo "--------------DONE---------------"
exit 0
