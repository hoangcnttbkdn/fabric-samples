#!/bin/bash
cd $HOME/blockchain-explorer
./stop.sh
cd $HOME/fabric-samples/first-network
echo y | ./byfn.sh down
exit 0
