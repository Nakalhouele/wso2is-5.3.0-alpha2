#!/bin/bash

# Includes 
source $(dirname $0)/__configurations.sh
source $(dirname $0)/common.sh

#--force-rm
docker build --force-rm \
    -t $PRODUCT_NAME:$PRODUCT_TAG \
    --build-arg WSO2_IS_VERSION=$PRODUCT_VERSION \
    --build-arg WSO_SOURCE_URL=$PRODUCT_SOURCE_URL .

# Wait for user action ensure that action doned successfully
read -rsp $'Press enter to continue...\n'
exit 0