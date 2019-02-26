FROM ubuntu:16.04
RUN apt update && apt install -y apache2 libapache2-mod-php
ADD public /var/www/html
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
