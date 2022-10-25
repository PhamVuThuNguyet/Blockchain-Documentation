#!/bin/bash
#Utility script that carries out the following:
# 1. Launches it in background
# 2. Packages the chaincode 
# 3. Installs the chaincode
WAIT_TIME=1s

source env.sh

# Kill peer if its running
killall peer &> /dev/null

# 1. Launch in background
peer node start &

# Give time to peer to launch
sleep   $WAIT_TIME

# 2. package
peer lifecycle chaincode package  $CC_PACKAGE_FILE -p chaincode_example02 --label $CC_LABEL

# 3. Install
peer lifecycle chaincode install  $CC_PACKAGE_FILE
