#!/usr/bin/env bash

command="sh ~/portal/configall.sh"
command2="rm -r /home/root/portal"
TIMEOUT="10"
PORTAL="/home/spacedust/hashonelab/portal"

for host in $(cat portaliplist.txt); do
 
	echo "	Sending portal to $host"

	sshpass -p admin scp -rp $PORTAL root@"$host":/home/root

done

	echo "Done!"

for host in $(cat portaliplist.txt); do

	echo "	" && echo "Activating portal on $host"

	sshpass -padmin ssh -oStrictHostKeyChecking=no -oCompression=yes \
      -oConnectTimeout=$TIMEOUT root@"$host" -t "$command"
done

for host in $(cat portaliplist.txt); do

	echo "	"

	echo "Closing portal on $host"

	sshpass -padmin ssh -oStrictHostKeyChecking=no -oCompression=yes \
     -oConnectTimeout=$TIMEOUT root@"$host" -t "$command2"
 done 

	echo "Done!"

exit