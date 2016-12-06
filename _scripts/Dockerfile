FROM openjdk:7
MAINTAINER Romeo KONE <Romeo.Kone@fircosoft.com>

# ARGS
ARG WSO2_IS_VERSION=5.3.0-beta
ARG ENVIRONMENT=PRODUCTION
ARG WSO_SOURCE_URL=https://github.com/wso2/product-is/releases
ARG GIT_SOURCE_URL=https://github.com/Nakalhouele/wso2is-5.3.0-alpha2.git
ARG GIT_SOURCE_DIR="/opt/git_source_dir"
ARG PROXY 
ARG WSO2_ADMIN_USERNAME=admin
ARG WSO2_ADMIN_PASSWORD=admin

# PROXY
ENV http_proxy ${PROXY}
ENV HTTP_PROXY ${PROXY}
ENV https_proxy ${PROXY}
ENV HTTPS_PROXY ${PROXY}
# WSO2 Identity Server version
ENV WSO2_IS_VERSION ${WSO2_IS_VERSION}
# WSO2 Identity Server home
ENV IS_HOME=/opt/wso2is-$WSO2_IS_VERSION
# Environment
ENV ENVIRONMENT ${ENVIRONMENT}

ENV GIT_SOURCE_URL ${GIT_SOURCE_URL}
ENV GIT_SOURCE_DIR ${GIT_SOURCE_DIR}
ENV WSO2_ADMIN_USERNAME ${WSO2_ADMIN_USERNAME}
ENV WSO2_ADMIN_PASSWORD ${WSO2_ADMIN_PASSWORD} 

# Update aptitude with new repo
RUN apt-get update

# ---------------------------------------------------
# WSO2 Identity Server Installation
# - Download a zip 
# - Unzip the downloaded zip 
# - Delete the downloaded zip (clean) 
# ---------------------------------------------------
RUN wget $WSO_SOURCE_URL/download/v$WSO2_IS_VERSION/wso2is-$WSO2_IS_VERSION.zip -P /opt \
    && unzip /opt/wso2is-$WSO2_IS_VERSION.zip -d /opt/ \
    && rm -rf /opt/wso2is-$WSO2_IS_VERSION.zip


ADD entry-point.sh /opt/entry-point.sh
RUN chmod +x /opt/entry-point.sh

# Define data volumes
VOLUME ["$IS_HOME/repository", "$GIT_SOURCE_DIR"]

# Expose WSO2 Identity Server ports
EXPOSE 9443
EXPOSE 9763
EXPOSE 8000
EXPOSE 10500

WORKDIR $IS_HOME/bin/

# Start WSO2 Identity Server
ENTRYPOINT  ["sh", "/opt/entry-point.sh"]