# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: daniel <daniel@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/09/15 16:43:36 by daniel            #+#    #+#              #
#    Updated: 2026/09/24 16:50:47 by daniel           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE = docker compose -f $(D_COMP)

D_COMP = srcs/docker-compose.yml

DATA = /home/$(USER)/data

MARIADB = $(DATA)/mariadb
WORDPRESS = $(DATA)/wordpress

all: up

up:
	mkdir -p $(MARIADB)
	mkdir -p $(WORDPRESS)

	$(COMPOSE) up --build -d

clean:
	$(COMPOSE) down --rmi all

fclean: clean
	$(COMPOSE) down -v
	sudo rm -rf $(DATA)
# 	sudo rm -rf $(MARIADB)
# 	sudo rm -rf $(WORDPRESS)

re: fclean all