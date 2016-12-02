#!/bin/bash
###############################################################
# This script creates a new container
###############################################################

set -e

# Includes
source $(dirname $0)/__configurations.sh
source $(dirname $0)/common.sh

image_id="${PRODUCT_NAME}:${PRODUCT_TAG}"
image_exists=$(docker images $image_id | wc -l)

if [[ ${image_exists} -eq 2 ]]; then
    _info "Docker image \"${image_id}\" already exist."
else
    _error "Docker image \"${image_id}\" not found. Maybe you forgot build."
    read -rsp $'Press enter to continue...\n'
    exit -1
fi

#--force-rm
docker run -d -t $image_id \
      --hostname $PRODUCT_NAME \
      --name $image_id \
      -p 9443:9443 -p 9763:9763 -p 8000:8000 \
      -p 10500:10500 $PRODUCT_NAME:$PRODUCT_TAG $*


# Wait for user action ensure that action doned successfully
read -rsp $'Press enter to continue...\n'
exit 0