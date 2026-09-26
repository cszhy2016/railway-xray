FROM alpine:latest
RUN apk add --no-cache ca-certificates curl unzip \
 && mkdir -p /usr/local/bin /etc/xray \
 && curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
 && unzip -o /tmp/xray.zip -d /usr/local/bin \
 && rm -f /tmp/xray.zip \
 && chmod +x /usr/local/bin/xray
COPY config.template.json /etc/xray/config.template.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
