#!/bin/sh
set -e
: "${PORT:=8080}"
: "${UUID:?UUID environment variable is required}"
: "${WS_PATH:=/xray}"
sed -e "s/__PORT__/${PORT}/g" \
    -e "s/__UUID__/${UUID}/g" \
    -e "s#__WS_PATH__#${WS_PATH}#g" \
    /etc/xray/config.template.json > /etc/xray/config.json
exec /usr/local/bin/xray run -config /etc/xray/config.json
