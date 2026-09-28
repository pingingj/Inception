#!/bin/bash

set -eu

DB_PASSWORD_USER=$(cat /run/secrets/path_userdb)
DB_PASSWORD_ROOT=$(cat /run/secrets/path_rootdb)

mkdir -p /var/lib/mysql
mkdir -p /run/mysqld
chown -R mysql:mysql /var/lib/mysql /run/mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

mariadbd --user=mysql --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock --skip-networking &
PID=$!
echo "Before PID: $!"
echo "Current Bash PID: $$"
for i in {1..10}; do
    if mariadb-admin --socket=/run/mysqld/mysqld.sock ping --silent; then
        break
    fi

    if [ "$i" -eq 10 ]; then
        echo "MariaDB failed to start"
        exit 1
    fi

    sleep 1
done

mariadb --socket=/run/mysqld/mysqld.sock -u root << EOF
CREATE DATABASE IF NOT EXISTS \`wordpress\`;
CREATE USER IF NOT EXISTS '${INTRA_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD_USER}';
ALTER USER '${INTRA_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD_USER}';
GRANT ALL PRIVILEGES ON \`wordpress\`.* TO '${INTRA_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_PASSWORD_ROOT}';
FLUSH PRIVILEGES;
EOF

echo "BEFORE PID: $!"
mariadb-admin --socket=/run/mysqld/mysqld.sock -u root --password="${DB_PASSWORD_ROOT}" shutdown
wait "$PID"
exec mariadbd --user=mysql --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock
