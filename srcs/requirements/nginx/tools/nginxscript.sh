#!/bin/bash

set -eu

openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-keyout /etc/nginx/ssl/inception.key \
	-out /etc/nginx/ssl/inception.crt \
	-subj "/C=PT/ST=Lisbon/L=Lisbon/O=42/OU=Inception/CN=dgarcez-.42.fr"