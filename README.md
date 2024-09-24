# inception

The goal of this project is to broaden the knowledge of system administration by using Docker. Several Docker images were created on a personal virtual machine to better understand how to manage multiple services in an isolated environment using Docker.


## Mandatory Part

### Docker Setup:
- There is a Docker Compose to manage all containers.
- Each Docker image correspond to a service and is run in its dedicated container.
- Alpine or Debian were used for the base images. Using ready-made Docker images was prohibited, except for Alpine/Debian.
- There is a Dockerfile for each service.

### Services:
- NGINX Container: TLSv1.2 or TLSv1.3 only.
- WordPress + php-fpm Container: Must be installed and configured, without NGINX.
- MariaDB Container: Must be installed and configured, without NGINX.

### Additional Configuration:
- A volume was created for the WordPress database.
- A second volume was created for the WordPress website files.
- A Docker network was created to connect all containers.
- Containers must restart automatically in case of a crash.
- A .env file was used to store sensitive data.
```  
In a real setting this document should not be shared on a public repository, therefore, you can create a .env file
on ./srcs/ with the following information:
```
```
MARIADB_DATABASE_NAME={mariadb_name}
MARIADB_USER={wp_user}
MARIADB_USER_PASSWORD={password}
HOSTNAME={login.42.fr}
WORDPRESS_ADMIN={login}
WORDPRESS_ADMIN_PASSWORD={password}
WORDPRESS_ADMIN_EMAIL={email}
WORDPRESS_GUEST={guest}
WORDPRESS_GUEST_PASSWORD={password}
WORDPRESS_GUEST_EMAIL={guest@mail.com}
FTP_USER={user}
FTP_USER_PASSWORD={password}
```

## Bonus Part
The bonus part entailed the introduction of additional services, each running on its own container. </br>
  - Setting up a Redis cache for your WordPress website.
  - Setting up an FTP server container pointing to your WordPress volume.
  - Creating a simple static website.
  - Setting up Adminer.
  - Adding any other useful service of your choice, I added Hexo (a blog no-code solution).


## How to run
1. Clone repository
    ```bash
    git clone git@github.com:mjorgecruz/42_inception.git
    ```
2. Go inside project directory and run `make`
    ```bash
    cd 42_inception
    make
    ```
3. Open browser and write `localhost`
