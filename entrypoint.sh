#!/bin/bash

# Overwrite the environment variable with the docker environment variable
mv -f .env.docker .env

# Wait for MySQL server to start
until ncat -z db 3306; do
    echo "Waiting for MySQL server to start..."
    sleep 1
done

# Create the database
php bin/console doctrine:database:create

# Start the web server
php -S 0.0.0.0:8000 -t public
