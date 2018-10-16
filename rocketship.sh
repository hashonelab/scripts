#!/bin/bash

MAC=$(cat /sys/class/net/eth0/address)
MACHINE=$(sed -n 2p /usr/bin/compile_time)

echo "		$MACHINE Rocket ready for ignition"

/etc/init.d/bmminer.sh stop

mv /usr/bin/bmminer /usr/bin/bmminer.old

mv ~/bmminer9v /usr/bin/bmminer

chmod +x /usr/bin/bmminer

/etc/init.d/bmminer.sh restart >/dev/null 2>&1

echo " 		$MACHINE Rocket Blast Off"

wait

