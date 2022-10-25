# Launches the Orderer
# If you are NOT using the vagrant setup then /home/vagrant will not be there
# as a result you would get an error - With this setup we are overriding the
# Filedger Location specified in the YAML file. 

# You may override this *but* make sure you adjust the clean.sh accordingly
export ORDERER_FILELEDGER_LOCATION=$HOME/ledgers/orderer/simple-two-orgs/ledger

# Change this to control logs verbosity
export FABRIC_LOGGING_SPEC=INFO

#### You may add other vars to override setup in orderer.yaml###
export FABRIC_CFG_PATH=$PWD

# Launch orderer
orderer