terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = ">= 2.15.0"  # Version spécifique ou contrainte de version
    }
  }
}

# Déclaration du fournisseur Docker
provider "docker" {
  host = "tcp://127.0.0.1:2375"
}

# Création du réseau Docker
resource "docker_network" "my_network" {
  name = "red_docker"
}

# Création du volume Docker
resource "docker_volume" "db_volume" {
  name = "volume_docker"
}

# Création du conteneur MariaDB
resource "docker_container" "mariadb" {
  image = "mariadb:latest"
  name  = "mariadb_container"
  ports {
    internal = 3306
    external = 3306
  }
  env {
    MYSQL_ROOT_PASSWORD = var.db_password
  }
  # Autres configurations du conteneur
  networks_advanced {
    name = docker_network.my_network.name
  }
  volumes {
    container_path  = "/var/lib/mysql"
    volume_name     = docker_volume.db_volume.name
    read_only       = false
  }
}

# Création du conteneur Wordpress
resource "docker_container" "wordpress" {
  image = "wordpress:latest"
  name  = "wordpress_container"
  ports {
    internal = 80
    external = 8080
  }
  links {
    name = "mariadb_container:db"
  }
  env = [
    "WORDPRESS_DB_PASSWORD=${var.db_password}"
  ]
  # Autres configurations du conteneur
  networks_advanced {
    name = docker_network.my_network.name
  }
}