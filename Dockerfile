# Add PHP-FPM base image
FROM php:5.6-fpm-alpine
# Install your extensions
# To connect to MySQL
RUN docker-php-ext-install mysql pdo pdo_mysql