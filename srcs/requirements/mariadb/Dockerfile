FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools/mariadbscript.sh /usr/local/bin/mariadbscript.sh

RUN chmod +x /usr/local/bin/mariadbscript.sh

ENTRYPOINT ["mariadbscript.sh"]