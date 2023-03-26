NAME =	inception

FILE =	srcs/docker-compose.yml

all:
	docker compose -p ${NAME} -f ${FILE} up --build -d

start:
	docker compose -p ${NAME} start

stop:
	docker compose -p ${NAME} stop

clean:
	docker compose -p ${NAME} down --rmi all

fclean:
	docker compose -p ${NAME} down --rmi all
	sudo rm -rf /home/rbourdil/data/*

.PHONY: all start stop clean fclean
