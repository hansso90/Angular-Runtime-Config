# Angular-Runtime-Config

## Use Case:

Angular client applications that are started in Kubernetes has different endpoints and you want to load these config endpoints at the startup of HTTP Server
This project will create the config.json at started of NGINX. When the Angular app is loading it will make a request to the assets where config.json file is created.

## Frameworks

- Angular 7.0
- Nginx 1.13
- Jq 

## Development server

Local run (localhost:4200):
`npm start`

## Multi stage build docker build

Create a docker image:
`docker build -t angular-runtime-config .`

Run your docker image:
`docker run -d -p 80:80 -e ANGULAR_ENV_NUMMER=1 -e TEST_ENV_NUMMER=2 -e ENV_PREFIX=TEST_ angular-runtime-config`

