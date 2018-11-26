FROM php:7.2-apache

RUN apt-get update \
    && apt-get install -y git libicu-dev

COPY config/php.ini /usr/local/etc/php
RUN docker-php-ext-install intl opcache

COPY config/bolt.conf /etc/apache2/sites-available
RUN a2dissite 000-default \
    && a2ensite bolt \
    && a2enmod rewrite \
    && service apache2 restart > /dev/null 2>&1

WORKDIR /var/www/html

RUN curl -s -O https://bolt.cm/distribution/bolt-latest.tar.gz \
    && tar -xzf bolt-latest.tar.gz --strip-components=1 \
    && php app/nut init

RUN chmod -R 777 app/cache/ extensions/ public/thumbs/ public/files/
