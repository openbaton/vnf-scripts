echo "--------------INSTALL---------------"

sudo apt-get update && sudo apt-get install screen
export LC_ALL=C
screen -S shard mongod --configsvr --dbpath /data/db --port 27019 --smallfiles &

echo "--------------DONE---------------"
exit 0
