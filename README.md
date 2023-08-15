# Django & VueJS Base Project

This project demonstrates a base setup for full-stack applications using Django and VueJs. This code can be referenced to make future projects easily and quickly, especially the Dockerization.

## Setup

```
docker compose up -d
```

## Localhost URLs

- The Django App will be located at [http://localhost:8000](http://localhost:8000)
- The VueJS application will be located at [http://localhost:8080](http://localhost:8080)
- phpMyAdmin will be located at [http://localhost:5555](http://localhost:5555)
- Mailhog will be located at [http://localhost:8025](http://localhost:8025)

## Django

The Django App will be located at [http://localhost:8000](http://localhost:8000).

### Creating an admin user

Run the following command _after_ the containers are running on your local:

```
docker compose exec django python manage.py createsuperuser
```

### Migrations

Run the following command _after_ the containers are running on your local to perform a migration:

```
docker compose exec django python manage.py migrate
```

To make migrations:

```
docker compose exec django python manage.py makemigrations
```

### Creating a new Django Project

Run the following command before you spin up the containers:

```
docker compose run django django-admin startproject <project-name> .
```

This will create a new Django Project (note: not a new Django Application - see [Django Applications](https://docs.djangoproject.com/en/3.2/ref/applications/)).

### Exporting the database

To export the current state of the database without the use of phpMyAdmin, use the following command:

```
docker compose exec database sh -c 'exec mysqldump -u root -p docker' > docker/local-dev/mariadb/data/database.sql
```

MariaDB can read in gzipped database files. To gzip the database file run the following command after the database `.sql` file has been exported:

```
gzip docker/local-dev/mariadb/data/database.sql
```

### Helpful Documentation Links for Django

- [Django 3.2 Documentation Site](https://docs.djangoproject.com/en/3.2/)
- [Django Applications](https://docs.djangoproject.com/en/3.2/ref/applications/)
- [djoser (REST Authentication Library)](https://djoser.readthedocs.io/en/latest/getting_started.html)
- [djoser Authentication Backends](https://djoser.readthedocs.io/en/latest/authentication_backends.html)

## VueJS

The VueJS application will be located at [http://localhost:8080](http://localhost:8080)

### Helpful Documentation Links for VueJS

- [VueJS Documentation Site](https://vuejs.org/guide/introduction.html)
- [Pinia (Vuex Store Replacement)](https://pinia.vuejs.org/)

## Mailhog

Mailhog will be located at [http://localhost:8025](http://localhost:8025).

MailHog is an email testing tool for developers:

- Configure your application to use MailHog for SMTP delivery
- View messages in the web UI, or retrieve them with the JSON API
- Optionally release messages to real SMTP servers for delivery

For more information, please see the [Mailhog GitHub repository](https://github.com/mailhog/MailHog).

## Helpful YouTube Tutorials

- [Monkhaus - Django & VueJS Basic Token Authentication in LESS than 30 Mins. ( Linux )](https://www.youtube.com/watch?v=XEZB-XbwihA)
- [Traversy Media - VueJS Crash Course](https://www.youtube.com/watch?v=qZXt1Aom3Cs)
- [Traversy Media - Vuex Crash Course | State Management](https://www.youtube.com/watch?v=5lVQgZzLMHc)
