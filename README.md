# pydapApp
This repository contains an exemplary pydap application and serves as an experimental server setup.

build docker image:
`docker build . -t occur_pydap`

start docker instance:
`docker run -p 8080:80 -v /data:/data occur_pydap`

environment variables:
  - APP_DEBUG (default: False)
  - APP_PATH (default: /data)
  - APP_HOST (default: 0.0.0.0)
  - APP_PORT (default: 80)