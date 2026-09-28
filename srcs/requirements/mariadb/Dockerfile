FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/config.cnf /etc/mysql/mariadb.conf.d/docker.cnf

COPY ./tools/mariadbscript.sh /usr/local/bin/mariadbscript.sh

RUN chmod +x /usr/local/bin/mariadbscript.sh

ENTRYPOINT ["mariadbscript.sh"]