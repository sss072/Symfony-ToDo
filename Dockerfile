FROM php:8.2-cli

# Install required packages
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libpq-dev \
    libzip-dev \
    unzip \
    zip

# Configure and install php extensions
RUN docker-php-ext-configure intl && \
    docker-php-ext-install intl pdo_mysql zip

# Download and install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy project files into container
COPY . /Symfony-ToDo

# Set the working directory
WORKDIR /Symfony-ToDo

# Install Composer dependencies
RUN composer install

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Execute the entrypoint script
CMD ["/entrypoint.sh"]

# Expose port 8000 for web access
EXPOSE 8000