*This project has been created as part of the 42 curriculum by **dgarcez--***.

# **Inception**

## Description

Inception is a project designed to introduce the fundamentals of Docker and containerization.

The objective of this project is to build a small infrastructure composed of different services, including MariaDB, WordPress, and NGINX, using Docker and Docker Compose.

Through this project, you will learn how to work with Docker images and containers, configure services using environment variables and configuration files, establish Docker networks, manage persistent volumes, and set up a database.

The project also introduces key concepts such as HTTP, TLS/SSL, reverse proxies, and communication between services in a containerized environment.

## Docker

Docker is used to develop and create applications. It seperates your applications from your infrastructure to facilitate delivery and testing. So instead of having to install every dependency in a project docker is able to bring the dependencies as if they were part of the project when those dependencies werent really made with the project.

The way it does this is with containers which are isolated environments with their own configuration but they all share the host's kernel, each service on inception is a container, NGINX, mariadb, wordpress. The containers just have the application running in them and then we connect these services with the docker compose file, which is able to connect the services. In the docker compose we use docker networks which is how we tell the containers how they should communicate with eachother.

## Docker vs Virtual machines

Docker is used for building, packaging and running applications without using many resources because of the isolated environments (containers), when virtual machines is a whole new environment that virtualizes hardware and run the operative system the user chose which is way heavier in resources than using docker.

## Secrets and environment variables

Environment variables are variables used for configuration files and scripts such as database names usernames.
Secrets are sensitive keys of information such as passwords, these are protected from unauthorized access.

## Docker network vs host network

Using a host network as your docker network makes it so you use the same networks as the host's machine.

As a result:
- Containers have less network isolation from the host.
- Containers use the host's ports directly.
- Port conflicts can occur with services that are already using specific ports.
- Port mapping (ports) is unnecessary and ignored.

With docker network which by default is the bridge network, it creates a virtual network with its own network namespace and subnets, providing network isolation from containers and the host.
- Containers have their own network interfaces and IP addresses.
- Containers can communicate with each other through the virtual network.
- Containers have network isolation from other networks.
- On user-defined bridge networks, Docker provides automatic DNS resolution, allowing containers to communicate using their names instead of IP addresses.


## Docker volumes vs Bind mounts

Docker volumes are used for persistent storage. While a container is being used, information may be written to the docker volumes for them to then be used again after a container is destroyed and rebuilt again. Docker volumes are created and managed by docker, while bind mounts are volumes created and managed by the host.

# Instructions

### Requirements:

	Docker
	Docker compose
	Git
	GNU make

### Build:

- Clone the repository:

		git clone https://github.com/pingingj/Inception.git

- Enter the repository directory and build the docker images of the project with make

		make

- Check if the docker images are up with docker ps

		docker ps

- Removing containers without deleting the persistent data from volumes

		make clean

- Removing containers and deleting the persistent data

		make fclean

# Resources

https://docs.docker.com/get-started/docker-overview/ - Docker documentation

https://medium.com/techmormo/how-do-docker-images-work-docker-made-easy-part-2-91d5c1a8d8a6 - What are Docker images and how they work.

https://docs.docker.com/get-started/docker-concepts/building-images/writing-a-dockerfile/ - How to write a dockerfile.

https://docs.docker.com/reference/dockerfile - Dockerfile instructions.

https://docs.docker.com/compose/ - About docker compose.

https://docs.docker.com/engine/network/ - About docker networks.

https://www.hostinger.com/tutorials/docker-cheat-sheet/?utm_source=google&utm_medium=cpc&utm_id=20959610637&utm_campaign=Generic-Tutorials-DSA-t1 - Docker commands on the terminal.

https://mariadb.com/docs/server/server-management/automated-mariadb-deployment-and-administration/docker-and-mariadb/creating-a-custom-container-image - Helped creating mariadb docker image.

https://www.php.net/manual/en/install.fpm.configuration.php - List of global php-fpm.conf directives, List of pool directives.

https://developer.wordpress.org/cli/commands/ - Wordpress commands.

https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose - Wordpress.

https://www.controle.net/faq/web-server-o-que-e-como-funciona-um-servidor-web - Learning about a web server

https://aws.amazon.com/pt/compare/the-difference-between-https-and-http/ - Learning about HTTP and HTTPS

https://www.ssldragon.com/blog/port-80-vs-port-443/#What-Is-Port-80-HTTP - Port 80 (HTTP) vs Port 443 (HTTPS).

https://nginx.org/en/docs/beginners_guide.html - Guide to NGINX, helps with config file.

## AI Usage

AI was used to help implement and understand the protocol used, as well as to help write this README.
