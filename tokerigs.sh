#!/usr/bin/env bash

command="cat /sys/class/net/eth0/address >> /home/root/info.txt"
command2="sed -n 2p /usr/bin/compile_time >> /home/root/info.txt"
command3="cat /home/root/info.txt"
TIMEOUT="10"
PORTAL="/home/spacedust/hashonelab/portal"

for host in $(cat portaliplist.txt); do

	echo "Getting MaC, Miner type on $host"

	sshpass -padmin ssh root@"$host" -t "$command && $command2"
done

wait

for host in $(cat portaliplist.txt); do

	echo "Saving results $host"

	sshpass -padmin ssh root@"$host" -t "$command3 && rm /home/root/info.txt" > /tmp/tokerigsmaclist.csv
 done 

	echo "Done!"

wait	

exit
