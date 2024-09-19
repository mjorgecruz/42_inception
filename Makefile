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
	if  [ ! -d "/home/$(USER)/data/static" ]; then \
		mkdir -p /home/$(USER)/data/static ; \
	fi
		if  [ ! -d "/home/$(USER)/data/hexo" ]; then \
		mkdir -p /home/$(USER)/data/hexo ; \
	fi

clean: down stop_container images_clean volume_clean network_clean
	docker system prune -a


fclean: down stop_container images_clean volume_clean network_clean

re: fclean all
down:
	@cd ./srcs && docker compose down

stop_container: 
	@if [ -n "$$(docker ps -qa)" ]; then docker stop $$(docker ps -qa) && docker rm $$(docker ps -qa); fi

images_clean:
	@if [ -n "$$(docker images -qa)" ]; then docker rmi -f $$(docker images -qa); fi

volume_clean:
	@if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q); fi

network_clean:
	@if [ -n "$$(docker network ls -q)" ]; then docker network rm $$(docker network ls -q) 2>/dev/null || true; fi
