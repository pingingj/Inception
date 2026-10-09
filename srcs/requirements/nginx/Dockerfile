FROM debian:bookworm

RUN apt-get update && \
	apt-get install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 443

COPY ./conf/config.cnf /etc/nginx/sites-available/default

COPY ./tools/nginxscript.sh /usr/local/bin/nginxscript.sh

RUN chmod +x /usr/local/bin/nginxscript.sh


ENTRYPOINT [ "nginxscript.sh" ]

