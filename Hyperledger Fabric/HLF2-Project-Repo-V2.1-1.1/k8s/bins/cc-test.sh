#!/bin/sh
# Use this for testing your cloud setup *or* even local setup :)
# Example ./cc-test.sh  install  
function    usage {
    echo  "Usage: ./cc-test.sh    install | instantiate | invoke | query "
    echo  "Installs the GoLang CC to specified Organization"
}

export CC_CONSTRUCTOR='{"Args":["init","a","100","b","200"]}'
# export CC_NAME="nodecc"
export CC_NAME="nodecc"
export CC_PATH="/var/hyperledger/nodechaincode/chaincode_example02"
export CC_VERSION="1.0"
export CC_CHANNEL_ID="airlinechannel"
export CC_LANGUAGE="node"

# Version 2.x
export INTERNAL_DEV_VERSION="1.0"
export CC2_PACKAGE_FOLDER="/var/hyperledger/packages"
export CC2_SEQUENCE=1
export CC2_INIT_REQUIRED="--init-required"

# Create the package with this name
export PACKAGE_NAME="$CC_NAME.$CC_VERSION-$INTERNAL_DEV_VERSION.tar.gz"
# Extracts the package ID for the installed chaincode
export LABEL="$CC_NAME.$CC_VERSION-$INTERNAL_DEV_VERSION"

OPERATION=$1

echo "CC Operation : $OPERATION    for   Org: $CURRENT_ORG_NAME"

# Extracts the package id from installed package
function cc_get_package_id {  
    OUTPUT=$(peer lifecycle chaincode queryinstalled -O json)
    PACKAGE_ID=$(echo $OUTPUT | jq -r ".installed_chaincodes[]|select(.label==\"$LABEL\")|.package_id")
}


# Packages & Installs the chaincode
function cc_install {

    # Create package folder if needed
    mkdir -p /var/hyperledger/packages

    # Check if package already exist
    if [ -f "$CC2_PACKAGE_FOLDER/$PACKAGE_NAME" ]; then
        echo "====> Step 1 Using the existing chaincode package:   $CC2_PACKAGE_FOLDER/$PACKAGE_NAME"
    else
        echo "====> Step 1 Creating the chaincode package $CC2_PACKAGE_FOLDER/$PACKAGE_NAME"
        peer lifecycle chaincode package $CC2_PACKAGE_FOLDER/$PACKAGE_NAME -p $CC_PATH \
                    --label="$CC_NAME.$CC_VERSION-$INTERNAL_DEV_VERSION" -l $CC_LANGUAGE
    fi
    echo "====> Step 2   Installing chaincode (may fail if CC/version already there)"
    peer lifecycle chaincode install  $CC2_PACKAGE_FOLDER/$PACKAGE_NAME  

    # set the package ID
    cc_get_package_id

    # Approving the chaincode
    echo "===> Step 3   Approving the chaincode"
    peer lifecycle chaincode approveformyorg --channelID $CC_CHANNEL_ID  --name $CC_NAME \
            --version $CC_VERSION --package-id $PACKAGE_ID --sequence $CC2_SEQUENCE \
            $CC2_INIT_REQUIRED    -o $ORDERER_ADDRESS  --waitForEvent

    echo "====> Step 4   Query if installed successfully" 
    peer lifecycle chaincode queryinstalled
}

function cc_instantiate {
    # set the package ID
    cc_get_package_id

    # if already committed do nothing
    CHECK_IF_COMMITTED=$(peer lifecycle chaincode querycommitted -C $CC_CHANNEL_ID -n $CC_NAME)
    if [ $? == "0" ]; then
        echo "===> Step 1   Chaicode Already Committed - Ready for invoke & query."
    else
        echo "===> Step 1   Committing the chaincode"
        peer lifecycle chaincode commit -C $CC_CHANNEL_ID -n $CC_NAME -v $CC_VERSION \
            --sequence $CC2_SEQUENCE  $CC2_INIT_REQUIRED    --waitForEvent

        echo "===> Step 3   Initing the chaincode"
        peer chaincode invoke  -C $CC_CHANNEL_ID -n $CC_NAME -c $CC_CONSTRUCTOR \
        --waitForEvent --isInit -o $ORDERER_ADDRESS 
    fi
}



# Invoke the "peer chain code" command using the operation
case $OPERATION in
    "install")   
        cc_install
        ;;
    "instantiate")
              cc_instantiate
        ;;
    "query")
            echo -n "query a="
            peer chaincode query -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["query","a"]}'
            echo -n "query b="
            peer chaincode query -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["query","b"]}'
        ;;
    
    "invoke")
            echo "Invoke sending 5 token from a=>b"
            peer chaincode invoke -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["invoke","a","b","5"]}'
        ;;

    *) usage
esac



