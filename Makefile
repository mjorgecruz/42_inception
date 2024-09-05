all:
	sudo docker system prune -a
	cd ./srcs && sudo docker compose up -d
