#
# usage configure.sh 
#

echo "--------------PREINIT---------------"

export LC_ALL=C

nc -z -w50 $ip1 27019
if [ $? -eq 0 ]
then
	exit 1
fi

mongos --configdb $ip1:27019 --port 27020 &

echo "--------------DONE---------------"
exit 0
