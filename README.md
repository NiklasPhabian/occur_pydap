# occur_pydap
This repository contains a pydap application and serves as an experimental server setup.
It is used to test the pydap fork at https://github.com/NiklasPhabian/pydap, which adds the feauture of automatic citation generation.

## Requirements
The application requires following python packages:

* pydap
    * either forked from https://github.com/NiklasPhabian/pydap
    * or from https://github.com/pydap/pydap
* netCDF4
* coards
* gsw
* optionally handlers from https://github.com/pydap

the requirements can e.g. be installed with:

    virtualenv -p /usr/bin/python2.7 pydap_env
    source pydap_env/bin/activate
    pip install netCDF coards gsw flask
    pip install git+https://github.com/NiklasPhabian/pydap
    pip install git+https://github.com/NiklasPhabian/pydap.handlers.netcdf
    
## Running occur_pydap
      python occur_pydap/app/main.py

## Dockerization
The application can be dockerzied using the included Dockerfile.

Build docker image: `docker build . -t occur_pydap`

The built docker image is also available at:
https://hub.docker.com/r/griessbaum/occur_pydap/

Start docker instance: `docker run -p 8080:80 -v ~/occur_pydap/data:/data occur_pydap`

In this command, we are mapping the container's port 80 to the host's port 8080 and bind mount the folder
~/occur_pydap/data to the container's folder /data.

environment variables:

* APP_DEBUG (default: False)
* APP_PATH (default: ~/occur_pydap/data)
* APP_HOST (default: 0.0.0.0)
* APP_PORT (default: 80)


### Container DNS configuration
As of Ubuntu 16.04 and Docker 1.12.6,
containers will fail to set up a DNS server in networks
that block external DNS servers.
The issue is described in: https://github.com/moby/moby/issues/23910
and resolved by:

    echo {"dns": ["172.17.0.1"]}  > /etc/docker/daemon.json
    echo listen-address=172.17.0.1 > /etc/NetworkManager/dnsmasq.d/docker-bridge.conf


