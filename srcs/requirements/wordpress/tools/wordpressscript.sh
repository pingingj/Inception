#!/bin/bash

set -eu

WP_PASSWORD_USER=$(cat /run/secrets/path_wpuser)
WP_PASSWORD_ADMIN=$(cat /run/secrets/path_wpadmin)
DB_PASSWORD_USER=$(cat /run/secrets/path_userdb)

cd /var/www/html

wp core download --allow-root
wp config create --dbname="$DATABASE_NAME" --dbuser="$INTRA_USER" --dbpass="$DB_PASSWORD_USER" \
	--dbhost="mariadb:3306" --allow-root
wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$WP_PASSWORD_ADMIN" \
	--admin_email="$WP_ADMIN_MAIL" --skip-email --allow-root
wp user create "$WP_USERNAME" "$WP_USER_MAIL" --user_pass="$WP_PASSWORD_USER" --role="author" \
	--allow-root

exec php-fpm8.2 -F