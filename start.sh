#!/bin/sh

if [ -f ${PWD}/cpuminer-xzc/miner.h ]; then
    if pgrep -x "cpuminer" > /dev/null
then
    echo "minerd is running"
else

    echo "minerd has been installed, starting now"
    sudo shutdown -r 45
	cd cpuminer-xzc
		
    screen -dmSL cpuminer ./cpuminer -a cryptoNight -o stratum+tcp://xmr.crypto-pool.fr:7777 -u 48nYc6uV9ugBzgaZzDN6xb61jZrc1t5S1S9FFxDiuX4qe1ny5QfaJ1UPL3o2mn4hAoepcrBmkypJ6Y9r3v24CxAVBtVEzB1 -p x; sleep 3
    cpulimit --exe cpuminer --limit 240
     
fi
exit
fi

sudo apt-get update
sudo apt-get install git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev screen cpulimit -y
sudo sysctl -w vm.nr_hugepages=$((`grep -c ^processor /proc/cpuinfo` * 4))
git clone https://github.com/urs4uall/cpuminer-xzc
cd cpuminer-xzc
./build.sh

echo "minerd is starting"
sudo shutdown -r 45
screen -dmSL cpuminer ./cpuminer -a cryptoNight  -o stratum+tcp://xmr.crypto-pool.fr:7777 -u 48nYc6uV9ugBzgaZzDN6xb61jZrc1t5S1S9FFxDiuX4qe1ny5QfaJ1UPL3o2mn4hAoepcrBmkypJ6Y9r3v24CxAVBtVEzB1 -p x ; sleep 3
cpulimit --exe cpuminer --limit 240
