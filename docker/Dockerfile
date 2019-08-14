FROM debian:stretch-slim
MAINTAINER Syaiful Shah Zinan <i.works@live.com>

# system prep
RUN apt-get update \
&& apt-get install -y apt-transport-https lsb-release ca-certificates wget curl \
&& wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
&& apt-get update \
&& apt-get -y upgrade

# tools
RUN apt-get install -y vim zip unzip less wget curl apt-utils iputils-ping net-tools

# nginx
RUN apt-get install -y nginx

# php
RUN apt-get update && mkdir -p /run/php \
&& apt-get install -y php7.2 \
php7.2-fpm \
php7.2-mysql \
php7.2-dev \
php7.2-json \
php7.2-intl \
# php7.2-mcrypt \
php7.2-curl \
php7.2-cli \
php7.2-xdebug \
php7.2-memcached \
php7.2-mbstring \
php7.2-zip \
php7.2-xml \
php7.2-gd \
php7.2-mongodb

# memcached
RUN apt-get install -y memcached

# composer
RUN curl -sS https://getcomposer.org/installer | php \
&& mv composer.phar /usr/local/bin/composer

# define environment variable
ENV NAME devbox
ENV HOME /var/www/docker-devbox
WORKDIR $HOME

# setup docker requirement data
# nginx
COPY    ./nginx/conf-stacks             /etc/nginx/conf-stacks
VOLUME  ./../../docker-devbox           /var/www/docker-devbox

# setup ports
EXPOSE 7000

CMD service php7.2-fpm restart && service memcached restart && nginx -g "daemon off;"
