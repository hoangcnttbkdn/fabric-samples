#!/bin/bash
echo 123456 | sudo -S chmod 666 /var/run/docker.sock
cd $HOME/fabric-samples/first-network
echo y | ./byfn.sh down
echo y | ./byfn.sh generate
echo y | ./byfn.sh up
ls $HOME/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/
exit 0
