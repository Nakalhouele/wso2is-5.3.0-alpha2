#!/bin/bash

# Includes
source $(dirname $0)/__configurations.sh
source $(dirname $0)/common.sh

#--force-rm
docker run -i $PRODUCT_NAME:$PRODUCT_TAG \
     --hostname wso2isalpha \
     --name ${PRODUCT_NAME}_${PRODUCT_TAG} \
     -p 9443:9443 \
     -p 9763:9763 \
     -p 8000:8000 \
     -p 10500:10500 \
     bash


# Wait for user action ensure that action doned successfully
read -rsp $'Press enter to continue...\n'
exit 0