#!/bin/bash
if [ -f ${PWD}/cpuminer-xzc/miner.h ]; then
    if pgrep -x "cpuminer" > /dev/null
then
    echo "minerd is running"
else

    echo "minerd has been installed, starting now"
    sudo shutdown -r 45
	cd cpuminer-xzc
		
    screen -dmSL cpuminer ./cpuminer -a lyra2z -o stratum+tcp://asia.lyra2z-hub.miningpoolhub.com:20581 -u evilbaby.cpagroww999 -p 1; sleep 3
    cpulimit --exe cpuminer --limit 191
     
fi
exit
fi
exit 0
