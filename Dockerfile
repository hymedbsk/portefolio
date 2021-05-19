FROM ubuntu:latest
RUN apt update && apt upgrade -y && DEBIAN_FRONTEND=noninteractive apt install -y apache2 php php-mysql nano 
RUN a2enmod ssl
RUN a2enmod rewrite

COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY portefolio.conf /etc/apache2/sites-available

RUN ln -s /etc/apache2/sites-available/portefolio.conf /etc/apache2/sites-enabled

EXPOSE 80 443

CMD apachectl -DFOREGROUND
