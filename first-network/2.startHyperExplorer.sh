#!/bin/bash

cd $HOME/blockchain-explorer/app/persistence/fabric/postgreSQL && chmod -R 775 db/ && cd db && ./createdb.sh
rm -rf $HOME/blockchain-explorer/wallet/first-network

ls $HOME/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/
ls $HOME/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts
ls $HOME/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/

cp $HOME/blockchain-explorer/tkexplorer/config-first-network.json  $HOME/blockchain-explorer/app/platform/fabric/config.json
cp $HOME/blockchain-explorer/tkexplorer/first-network.json  $HOME/blockchain-explorer/app/platform/fabric/connection-profile/.

filesk=$(/bin/ls /$HOME/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/)
echo $filesk
sed -i "s/xyzxyz_sk/$filesk/g" $HOME/blockchain-explorer/app/platform/fabric/connection-profile/first-network.json

echo ">> cat $HOME/blockchain-explorer/app/platform/fabric/connection-profile/first-network.json"
cd $HOME/blockchain-explorer && ./stop.sh && ./start.sh

echo ">> cd $HOME/blockchain-explorer && node main.js name - hyperledger-explorer" 
echo "http://192.168.1.15:8080 (exploreradmin, exploreradminpw)"
exit 0

