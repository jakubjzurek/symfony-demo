FROM php:8.1-apache
# Instalujemy narzędzie Composer (menedżer pakietów PHP)
RUN apt-get update && apt-get install -y wget unzip && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    rm composer-setup.php

COPY . /var/www/html
RUN cd /var/www/html &&  composer install --optimize-autoloader

EXPOSE 80

CMD php -S 0.0.0.0:80 -t public/
