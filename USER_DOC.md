# User Documentation

This file will give users and administrations information about the services provided, how to start and stop the project, how to access the website and administration panel, locate and manage credentials and check the services that are running correctly


## Services
This project uses 3 services, Mariadb, Wordpress and NGINX, each service has its own container.

### Mariadb
Mariadb is used as a database for wordpress, it stores information such as users, posts, comments.
Mariadb is connected to the wordpress container so it is able to recieve said information and store it.
The information stored in the database is also written in the named volumes so when the container is rebuilt is able to get back its information.

### Wordpress
Since wordpress is a php application its container needs a php runtime to execute the wordpress code. 
Wordpress container offers the main website to the user, executes php code and makes SQL queries (mariadb).
So this container has to be connected to mariadb and NGINX since it interacts with the database and the webserver which isnt able to process php files.

### NGINX
NGINX is a webserver used to process HTTP or HTTPS requests and handle the TLS certificate to ensure safety while exchanging data with the client and the server.
It forwards php requests to Wordpress through FastCGI, where PHP-FPM executes the php code and sends the result back to NGINX which then sends it back to the client.

## Workflow

The user accesses the website initiating an HTTPS connection to NGINX, NGINX processes the request and presents its certificate back to the user, they then perform a key exchange to establish shared session keys so their communication is encrypted.
Once the connection is established the user is able to interact with wordpress.
For example if the user makes a post with wordpress, an HTTPS request is sent to NGINX which is the forwarded to php-fpm to execute the php code, the post is stored in the database and its result is sent back to the user, by showing the post posted.
