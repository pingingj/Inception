FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y \
        php8.2-fpm \
        php8.2-mysql && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]
