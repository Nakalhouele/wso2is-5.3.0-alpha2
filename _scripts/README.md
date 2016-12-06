> ##
> # WIP


# Docker image of WSO2 Identity Server.

## Tags
- 5.3.0-beta (latest)

## Description

### Files
>        - _scripts |
>                   |- __configurations.sh
>                   |- build-dockerfile.sh
>                   |- common.sh
>                   |- compose.sh
>                   |- docker-compose.yml
>                   |- Dockerfile
>                   |- run-dockerfile.sh


## Usage
 
### Default properties

> Some default values of properties are fixed in the __*Dockerfile*__.

```
WSO2_IS_VERSION = 5.3.0-beta
ENVIRONMENT = PRODUCTION
WSO_SOURCE_URL = https://github.com/wso2/product-is/releases
GIT_SOURCE_URL = https://github.com/Nakalhouele/wso2is-5.3.0-alpha2.git
GIT_SOURCE_DIR = "/opt/git_source_dir"
PROXY   
WSO2_ADMIN_USERNAME = admin
WSO2_ADMIN_PASSWORD = admin
tag_or_commit_version
```

### Build Dockerfile

- Default properties can be overrided using one or more __--build-arg__ flags.
- Make sure you are in the same directory as the Dockerfile

```
docker build --force-rm \                               # 
    --tag "$PRODUCT_NAME:$PRODUCT_TAG" \                # Set image name
    --build-arg WSO2_IS_VERSION=$PRODUCT_VERSION \      # Override WSO2_IS_VERSION value
    --build-arg WSO_SOURCE_URL=$PRODUCT_SOURCE_URL \    # Override WSO_SOURCE_URL value
    --build-arg PROXY=$PROXY_URL \                      # Override PROXY value
    --build-arg ENVIRONMENT=$PRODUCT_ENVIRONMENT .      # Override ENVIRONMENT value and build Dockerfile located in current directory.
```

### Run image

- Default properties can be overrided using one or more __--env__ flags.

```
docker run --hostname "${PRODUCT_NAME}" \                                           # Set hostname
      --name "$CONTAINER_NAME" \                                                    # Set container name
      -p 9443:9443 -p 9763:9763 -p 8000:8000 -p 10500:10500 \                       # Expose ports
      --env WSO2_ADMIN_USERNAME="admin" --env WSO2_ADMIN_PASSWORD="password"\  # Set environment variables
      -v "${PRODUCT_NAME}_repository:/opt/wso2is-$PRODUCT_VERSION/repository"\      # Mount volumes
      -d "$image_id"                                                                # Image id to get/pull 
```




## Access

## RUN SH
     

#############################################################################
# How to connect to a docker container from outside the host (same network)
 [Windows]

        1. Open Oracle VM VirtualBox Manager
        2. Select the VM used by Docker
        3. Click Settings -> Network
        4. Adapter 1 should (default?) be "Attached to: NAT"
        5. Click Advanced -> Port Forwarding
        6. Add rule: Protocol TCP, Host Port 8080, Guest Port 8080 (leave 
           Host IP and Guest IP empty)
        7. You should now be able to browse to your container via 
           localhost:8080 and your-internal-ip:8080.


