#!/bin/bash

cd $HOME/blockchain-explorer/app/persistence/fabric/postgreSQL && chmod -R 775 db/ && cd db && ./createdb.sh
rm -rf $HOME/blockchain-explorer/wallet/first-network
rm -rf $HOME/blockchain-explorer/wallet/test-network

ls $HOME/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/
ls $HOME/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts

cp $HOME/blockchain-explorer/tkexplorer/config-test-network.json  $HOME/blockchain-explorer/app/platform/fabric/config.json
cp $HOME/blockchain-explorer/tkexplorer/test-network.json  $HOME/blockchain-explorer/app/platform/fabric/connection-profile/.

cd $HOME/blockchain-explorer && ./stop.sh && ./start.sh

echo ">> cd $HOME/blockchain-explorer && node main.js name - hyperledger-explorer" 
echo "http://192.168.1.15:8080 (exploreradmin, exploreradminpw)"
exit 0

