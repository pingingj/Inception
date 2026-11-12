# Developer document

This file explains how a developer can set up the environment from scratch, build and launch the project, relevant commands to manage docker containers and volumes and identify where data is stored and how it persists.

## Environment
### Prerequisites
This project was developed in a virtual machine on debian 12 bookworm.

Requirements needed to create the project

- curl - command-line tool used to download data from URLs.
- ca-certificates - allows Debian to trust HTTPS connections.
- gnupg - Provides GPG (GNU privacy key) tools
- Docker - Creates images, containers, manages volumes.
- Docker compose - Configures the containers and connects containers to the user bridge network.
- Git - Repository of the project.
- GNU make - Builds the project.

## Installation

### Docker dependencies
To install the official docker repository curl, ca-certificates and gnupg must be installed since they are docker dependencies.

	sudo apt-get install ca-certificates curl gnupg -y

To be able to use Dockers official APT repository we must create this directory to save dockers GPG key so APT can read it to authenticate the packages.  

	sudo install -m 0755 -d /etc/apt/keyrings

### Fetching docker's official repository
Afterwards we fetch the Docker GPG key to authenticate docker packages and we convert it into binary GPG format and save it in a specific location.

	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

Since APT needs read access to the GPG key we give it read permissions for all users with this command

	sudo chmod a+r /etc/apt/keyrings/docker.gpg

Now we add Docker's official repository to APT with this command:

	echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \ 
	$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

After adding a repository to APT we must update it so its able to use Dockers repository

	sudo apt-get update

### Installing docker
We can now install dockers engine by installing these

- docker-ce - Docker engine daemon
- docker-ce-cli - Docker command line interface
- containerd.io - Container runtime
- docker-buildx-plugin - Image build support
- docker-compose-plugin - Docker compose v2.

Install them with this command

	sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

To start docker service and enable it on boot use these commands

	sudo systemctl start docker
	sudo systemctl enable docker

Add user to docker group so we give the user root level access through containers since some docker commands require root privilegies and then apply group changes with the command afterwards

	sudo gpasswd -a $USER docker
	newgrp docker

### Checks
To check if everything was installed correctly run these commands:

	docker --version
	docker compose version
	make --version
	git --version
	docker ps

## Environment
For sensitive data I store it in a secrets folder which contains passwords

- MariaDBUser.txt - MariaDB User password
- MariaDBRoot.txt - MariaDB Admin password
- WordPressUser.txt - WordPress User Password
- WordPressRoot.txt - WordPress Admin password

For non sensitive data I created a .env file which contains information like:
DOMAIN_NAME="dgarcez-.42.fr"
DATABASE_NAME="wordpress"
INTRA_USER="dgarcez-"

# wordpress
WP_TITLE="inception"
WP_ADMIN_NAME="dgarcez-"
WP_USERNAME="user"
WP_USER_MAIL="user@gmail.com"
WP_ADMIN_MAIL="admin@gmail.com"
WP_URL="https://dgarcez-.42.fr"


###  
