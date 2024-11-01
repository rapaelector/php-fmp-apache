# Add PHP-FPM base image
FROM php:5.6-fpm-alpine
# Install your extensions
# To connect to MySQL
RUN docker-php-ext-install mysql pdo pdo_mysql
RUN apk --update --no-cache add autoconf g++ make && \
    pecl install -f xdebug-2.5.0 && \
    docker-php-ext-enable xdebug && \
    apk del --purge autoconf g++ make
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


RUN chown -R www-data:www-data /var/www/html
USER www-data