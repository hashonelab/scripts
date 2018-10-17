#!/usr/bin/env bash

command="cat /sys/class/net/eth0/address >> /home/root/info.txt"
command2="sed -n 2p /usr/bin/compile_time >> /home/root/info.txt"
command3="cat /home/root/info.txt"
TIMEOUT="10"

for host in $(cat portaliplist.txt); do

	echo "		Cleaning mess $host"

	sshpass -padmin ssh -oStrictHostKeyChecking=no -oCompression=yes \
     -oConnectTimeout=$TIMEOUT root@"$host" -t "$command3 && rm /home/root/info.txt" > /tmp/tokerigsmaclist.csv
 done 

	echo "		Done!"

wait	

exit
