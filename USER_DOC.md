# User Documentation

This file will give users and administrators information about the services provided, how to start and stop the project, how to access the website and administration panel, locate and manage credentials and check the services that are running correctly


## Services
This project uses 3 services, MariaDB, WordPress and NGINX, each service has its own container.

### MariaDB
MariaDB is used as a database for WordPress, it stores information such as users, posts, comments.
MariaDB is connected to the WordPress container so it is able to receive said information and store it.
The information stored in the database is also written in the named volumes so when the container is rebuilt is able to get back its information.

### WordPress
Since WordPress is a PHP application its container needs a PHP runtime to execute the WordPress code. 
WordPress container offers the main website to the user, executes PHP code and makes SQL queries (MariaDB).
So this container has to be connected to MariaDB and NGINX since it interacts with the database and the webserver which isn't able to process PHP files.

### NGINX
NGINX is a webserver used to process HTTP or HTTPS requests and handle the TLS certificate to ensure safety while exchanging data with the client and the server.
It forwards PHP requests to WordPress through FastCGI, where PHP-FPM executes the PHP code and sends the result back to NGINX which then sends it back to the client.

## Workflow

The user accesses the website initiating an HTTPS connection to NGINX, NGINX processes the request and presents its certificate back to the user, they then perform a key exchange to establish shared session keys so their communication is encrypted.
Once the connection is established the user is able to interact with WordPress.
For example if the user makes a post with WordPress, an HTTPS request is sent to NGINX which is then forwarded to PHP-fpm to execute the PHP code, the post is stored in the database and its result is sent back to the user, by showing the post.

## Start and stop

### Start
To start up the project you must go on your terminal, enter the repository directory and type in the command make

	make

It will then create the docker images and the 3 containers, to check if the containers are all stable and running use the command docker ps, which shows the status of each container.

	docker ps

### Stop
To stop the project you can use the command make fclean which destroys all containers, images and volumes of the project.

	make fclean

If you want to just delete the current containers but keep the persistent data you can use make clean

	make clean

## Access the website and administration panel
To access the website after building the project open up a browser and type the domain dgarcez-.42.fr which will send you to the WordPress page, since this project uses a self-signed TLS the browser may show a warning,
which you can then accept to access the website.

	https://dgarcez-.42.fr/

To access the administration panel you can use this link.

	https://dgarcez-.42.fr/wp-admin/

Here you enter the login of the admin credentials, and you can then manage posts and comments from the project's WordPress

## Credentials
The credentials are located in the secrets directory at the root of project, it contains various passwords to WordPress and MariaDB.

	./secrets

The non-sensitive info is stored in the .env file which is located in:

	srcs/.env

## Checking services
After building the project use docker ps to check each container to see if they are healthy

	docker ps

### MariaDB
To check if MariaDB is running correctly you can run the command:

	docker exec -it MariaDB	MariaDB -u dgarcez- -p 

This command makes it so you enter the MariaDB container and the MariaDB service.

You will be prompted the password for the user which can be found in secrets.
After you can use the command:

	USE WordPress

This command will make you select the projects database, you can then see the tables by using this command:

	SHOW TABLES

### WordPress + PHP-fpm
To verify that the WordPress files are present:

	docker exec WordPress ls -la /var/www/html

And you can check if PHP-fpm is working by running:

	docker exec WordPress ps aux

### NGINX
You can check if the NGINX configuration is correct by running this command:

	docker exec nginx nginx -t

And by running this command it will show which ports nginx is listening on:

	docker exec nginx ss -lntp

To verify that the website is accessible through NGINX, you can run:

	curl -k -I https://dgarcez-.42.fr/

### Debug
If a certain container has an error or a misconfiguration you can check it by running this command:

	docker logs <container_name>

It will then present the logs of the container.
