# Explicación de las Configuraciones en los Archivos docker-compose.yml

## Docker 1/docker-compose.yml

En este archivo de Docker Compose se configuran dos servicios: Drupal y MySQL.

- **Drupal Service:**
  - Utiliza la imagen oficial de Drupal.
  - Expone el puerto 81 del host, mapeado al puerto 80 del contenedor Drupal para el servidor web.
  - Monta un volumen para persistir los datos de Drupal.

- **MySQL Service:**
  - Utiliza la imagen oficial de MySQL.
  - Monta un volumen para persistir los datos de MySQL.
  - Define una variable de entorno para establecer la contraseña root de MySQL.

Estas configuraciones permiten ejecutar una instancia de Drupal conectada a una base de datos MySQL, con los datos persistidos en volúmenes Docker.

## Docker 2/docker-compose.yml

Este archivo de Docker Compose configura dos servicios: WordPress y MariaDB.

- **WordPress Service:**
  - Utiliza la imagen oficial de WordPress.
  - Expone el puerto 82 del host, mapeado al puerto 80 del contenedor WordPress para el servidor web.
  - Está conectado a la red `redDocker` para comunicarse con el servicio MariaDB.
  - Depende del servicio MariaDB para su funcionamiento.

- **MariaDB Service:**
  - Utiliza la imagen oficial de MariaDB.
  - Está conectado a la red `redDocker` para comunicarse con el servicio WordPress.
  - Define una variable de entorno para establecer la contraseña root de MariaDB.

Estas configuraciones permiten ejecutar una instancia de WordPress conectada a una base de datos MariaDB, con los datos persistidos en volúmenes Docker y comunicación entre los servicios a través de una red definida en Docker.

Asegúrate de tener Docker y Docker Compose instalados y ejecuta `docker-compose up` en cada directorio para iniciar los servicios respectivos.