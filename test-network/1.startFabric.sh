#!/bin/bash
echo 123456 | sudo -S chmod 666 /var/run/docker.sock
# cd $HOME/fabric-samples/test-network
echo y | ./network.sh down
echo y | ./network.sh up createChannel -i 2.2
exit 0
