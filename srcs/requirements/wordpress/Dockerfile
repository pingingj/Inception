FROM debian:bookworm

RUN apt-get update && apt-get install -y php8.2-fpm php8.2-mysql curl mariadb-client && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html

RUN chown -R www-data:www-data /var/www/html /run/php

COPY ./conf/config.cnf /etc/php/8.2/fpm/pool.d/www.conf

COPY ./tools/wordpressscript.sh /usr/local/bin/wordpressscript.sh

RUN chmod +x /usr/local/bin/wordpressscript.sh

EXPOSE 9000

ENTRYPOINT ["wordpressscript.sh"]
