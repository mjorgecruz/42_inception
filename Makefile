all: volumes
	cd ./srcs && docker compose up -d --build

volumes:
	if [ ! -d "/home/$(USER)/data" ]; then \
		mkdir -p /home/$(USER)/data ; \
	fi
	if [ ! -d "/home/$(USER)/data/wordpress" ]; then \
		mkdir -p /home/$(USER)/data/wordpress ; \
	fi
	if  [ ! -d "/home/$(USER)/data/mariadb" ]; then \
		mkdir -p /home/$(USER)/data/mariadb ; \
	fi

clean:
	cd ./srcs && docker compose down
	docker system prune -a
	docker volume prune -a 
	docker volume rm srcs_wordpress_data srcs_mariadb_data
	rm -rf /home/$(USER)/data;

fclean: 
	docker stop $(docker ps -qa); docker rm $(docker ps -qa)
	docker rmi -f $(docker images -qa)
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls -q) 2>/dev/null^C