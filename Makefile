all:
	cd ./srcs && sudo docker compose up -d

clean:
	cd ./srcs && sudo docker compose down
	sudo docker system prune -a
