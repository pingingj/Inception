#!/bin/bash

set -eu

mkdir -p /var/lib/mysql
mkdir -p /run/mysqld
chown -R mysql:mysql  "/var/lib/mysql" "/run/mysqld"

mariadb-install-db --user=mysql --datadir=/var/lib/mysql
mariadb --user=mysql --skip-networking &
PID=$!
until mariadb-admin ping --silent; do
sleep 1
done