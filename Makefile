COMPOSE = srcs/docker-compose.yml

all:
	docker-compose -f $(COMPOSE) up --build
wordpress:
	docker-compose -f $(COMPOSE) exec wordpress sh
nginx:
	docker-compose -f $(COMPOSE) exec nginx sh
mariadb:
	docker-compose -f $(COMPOSE) exec mariadb sh
down:
	docker-compose -f $(COMPOSE) down -v
rm:
	docker builder prune