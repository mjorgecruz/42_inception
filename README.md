# inception

The goal of this project is to broaden the knowledge of system administration by using Docker. Several Docker images were created on a personal virtual machine to better understand learn how to manage multiple services in an isolated environment using Docker.


## Mandatory Part

    Docker Setup:
        Use Docker Compose to manage your containers.
        Each Docker image must correspond to a service and run in its dedicated container.
        Use either Alpine or Debian for the base images.
        Write your own Dockerfiles for each service. You are not allowed to use ready-made Docker images, except for Alpine/Debian.

    Services:
        NGINX Container: Must use TLSv1.2 or TLSv1.3 only.
        WordPress + php-fpm Container: Must be installed and configured, without NGINX.
        MariaDB Container: Must be installed and configured, without NGINX.
        Create a volume for your WordPress database.
        Create a second volume for your WordPress website files.
        Establish a Docker network connecting all containers.

    Additional Configuration:
        Containers must restart automatically in case of a crash.
        Do not use hacky patches like tail -f or sleep infinity.
        Use environment variables for configuration and store sensitive data securely.

    Domain Configuration:
        Configure your domain name (login.42.fr) to point to your local IP address.

    Note: The latest tag is prohibited, and no passwords should be present in your Dockerfiles.

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
