#!/bin/bash

# Wait for the MySQL server to be ready
#./wait-for db:3306 -t 60

# Overwrite the environment variable with the docker environment variable
mv -f .env.docker .env

# Create the database
php bin/console doctrine:database:create

# Start the web server
php -S 0.0.0.0:8000 -t public