FROM php:5.4-apache
RUN apt-get update && apt-get install -y libmcrypt-dev --no-install-recommends
RUN docker-php-ext-install mbstring mcrypt
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-enable mysqli
RUN pecl install redis-2.2.8 \
    && docker-php-ext-enable redis
RUN docker-php-ext-install gd
RUN mv /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enable/
RUN mv "/usr/src/php/php.ini-development" "$PHP_INI_DIR/php.ini"
