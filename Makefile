all: volumes
	cd ./srcs && docker compose up -d --build

volumes:
	if [ ! -d "/home/$(USER)/data" ]; then \
		mkdir /home/$(USER)/data ; \
	fi
	if [ ! -d "/home/$(USER)/data/wordpress" ]; then \
		mkdir /home/$(USER)/data/wordpress ; \
	fi
	if  [ ! -d "/home/$(USER)/data/mariadb" ]; then \
		mkdir /home/$(USER)/data/mariadb ; \
	fi

clean:
	cd ./srcs && docker compose down
	docker system prune -a
	docker volume prune -a 
	docker volume rm srcs_wordpress_data srcs_mariadb_data
	rm -rf /home/$(USER)/data;