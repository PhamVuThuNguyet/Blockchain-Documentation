=================================
Updated for Fabric 2.x : May 2020
* The -asOrg flag now takes MSP ID instead of Org Name
=================================
# cp-config.sh
Initializes the configtx config files - use it if you have made changes to the YAML

# Generate the crypto material
- Copy the setup/config/simple-two-org/crypto.1/crypto-config.yaml  to cryptogen/simple-two-org
  [Or-Use] ./cp-config.sh

- cd configtx/simple-two-org
- cryptogen generate --config=../../cryptogen/simple-two-org/crypto-config.yaml

# Generate the genesis
export FABRIC_CFG_PATH=$PWD
configtxgen -profile AcmeOrdererGenesis -channelID ordererchannel -outputBlock acme-genesis.block
configtxgen -inspectBlock ./acme-genesis.block

# Generate the channel tx
configtxgen -outputCreateChannelTx ./acme-channel.tx  -profile AcmeChannel -channelID acmechannel

configtxgen -inspectChannelCreateTx acme-channel.tx


# Generate the anchor peer update tx
configtxgen -outputAnchorPeersUpdate ./Org1Anchors.tx -profile AcmeChannel -channelID acmechannel -asOrg Org1MSP

configtxgen -inspectChannelCreateTx Org1Anchors.tx

# Print as
configtxgen -printOrg Org1