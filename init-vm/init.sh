#!/bin/bash

chmod +x run.sh

apt update && apt install -y golang fish

cp config.fish /root/.config/fish/config.fish

go get github.com/yudai/gotty

cp /root/go/bin/gotty /usr/local/bin/

openssl req -x509 -nodes -days 9999 -newkey rsa:2048 -keyout ~/.gotty.key -out ~/.gotty.crt


