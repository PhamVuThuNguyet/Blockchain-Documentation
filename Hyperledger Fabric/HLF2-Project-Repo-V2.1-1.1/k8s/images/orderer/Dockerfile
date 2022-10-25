# Updated to Fabric 2.x
#1. Docker file for setting up the Orderer
# FROM hyperledger/fabric-orderer:1.4.2
FROM hyperledger/fabric-orderer:2.1

LABEL  maintainer="Rajeev Sakhuja <raj@acloudfan.com>"

#2. Create the folder for configurations
RUN mkdir -p /var/hyperledger/config

#3. Copy the crypto for orderer
COPY ./config/crypto-config/ordererOrganizations/acme.com/orderers/orderer.acme.com /var/hyperledger/orderer.acme.com

#4. Copy the genesis file
COPY ./config/orderer/airlinegenesis.block  /var/hyperledger/config/airlinegenesis.block

#5. Copy the orderer YAML
COPY ./config/orderer/orderer.yaml /var/hyperledger/config/orderer.yaml

#6. Launch the Orderer
CMD orderer

