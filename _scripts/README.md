>##################################################################
>## WIP
>##################################################################

# Docker image of WSO2 Identity Server.

## Tags
- 5.3.0-alpha2 (latest)

## Description

### Files
>        - _scripts |
>                   |- __configurations.sh
>                   |- build.sh
>                   |- common.sh
>                   |- docker-compose.yml
>                   |- Dockerfile
>                   |- run.sh


## Usage

## 1. Build 

* Build image from Dockerfile 

        ./build.sh

* Build image command line

        docker build . 

## 2. Run an Image

        ./run.sh

## 3. Using docker-compose



## Access

### External
        https://docker_machine:32790/carbon

### Internal
    
        https://localhost:9443/carbon




## RUN SH
        



##########################
# Remove image
        docker rmi <IMAGE ID>