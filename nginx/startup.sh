#!/bin/ash

echo "[$(date -u) ] -- Starting to extract config. Using ENV_PREFIX: ${ENV_PREFIX:=ANGULAR_}"

jq -n env | jq 'delpaths([ keys[] | select(startswith("'${ENV_PREFIX:=ANGULAR_}'") | not) | [.]])' | jq 'with_entries( .key |= sub("'${ENV_PREFIX:=ANGULAR_}'"; ""))' > /usr/share/nginx/html/angular-runtime-config/assets/config.json

echo "[$(date -u) ] -- Config.json is ready -- Starting Nginx"

nginx -g 'daemon off;'