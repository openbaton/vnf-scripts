echo "--------------INSTALL---------------"

sudo apt-get update && sudo apt-get install screen
export LC_ALL=C
screen -S shard mongo --shardsrv --smallfiles --port 27017 &

echo "--------------DONE---------------"
exit 0
