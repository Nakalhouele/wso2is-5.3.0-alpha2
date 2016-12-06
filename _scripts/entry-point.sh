#!/bin/sh

set -e

if [ ! -d ${GIT_SOURCE_DIR} ]; then
    mkdir -p ${GIT_SOURCE_DIR}
fi

cd ${GIT_SOURCE_DIR}

if [ ! -z $tag_or_commit_version ]; then 
    git status
    if [ $? -eq 0 ]; then
        git checkout $tag_or_commit_version .
    fi
else #  Installation without version number
    git clone ${GIT_SOURCE_URL} .
fi

# Probleme avec cp
cp -r -f ${GIT_SOURCE_DIR}/conf/* ${IS_HOME}/repository/conf/

/opt/wso2is-${WSO2_IS_VERSION}/bin/wso2server.sh -DWSO2_ADMIN_USERNAME=${WSO2_ADMIN_USERNAME} -DWSO2_ADMIN_PASSWORD=${WSO2_ADMIN_PASSWORD}