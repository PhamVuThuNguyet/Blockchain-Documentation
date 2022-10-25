# Common launch error
2019-02-09 15:03:05.535 UTC [orderer.common.server] Main -> ERRO 001 failed to parse config:  Error reading configuration: Unsupported Config Type ""

Happens because Fabric requires the FABRIC_CFG_PATH to be set, earlier versions fell back to $PWD not anymore !!

To address the error:

export FABRIC_CFG_PATH=$PWD
orderer

# Scripts

./clean.sh      Cleans the ledger
./clean.sh  all Cleans the ledger + all generated artifacts

./init.sh       Cleans and regenerate the orderer artifacts 
                Use it if you have made changes to configtx.yaml | orderer.yaml
./init.sh   all    Overwrites configtx.yaml and orderer.yaml before initializing the setup

./launch.sh     Launches the orderer

#1 Use the crypto-config.yaml folder under the cryptogen/simple-two-org folder
> cryptogen generate --config=../../cryptogen/simple-two-org/crypto-config.yaml

#2 Copy the file configtxgen/configtx.yaml to the current folder

export FABRIC_CFG_PATH=$PWD
export ORDERER_GENERAL_LOGLEVEL=debug

Generate the genesis.block file
===============================
- Default chain id = testchainid        
> configtxgen -profile AcmeOrdererGenesis -outputBlock ./acme-genesis.block 
- Provide the channel ID
> configtxgen -profile AcmeOrdererGenesis -outputBlock ./acme-genesis.block -channelID ordererchannel

Generate the Channel Tx
=======================
> configtxgen -profile AcmeChannel -outputCreateChannelTx ./acme-channel.tx -channelID acmechannel

==============================
Convert genesis block to JSON
==============================
1. Create a temp folde
   mkdir temp

2. Convert the genesis block to json
configtxlator proto_decode --type common.Block --input acme-genesis.block --output ./temp/test.json

3. Checkout the json file

Setup Kafka
===========
1. Launch Kafka
2. Check the topics

1. Execute the ./clean.sh to clear up the orderer 
2. Make a change to the configtx
    OrdererType: kafka
    Addresses:
        - localhost:9092            <<Bootstrap Broker Address>>
3. Generate the genesis block
4. Launch Orderer

5. Check the topics - we will see the ordererchannel as one of the topics

