FROM debian:stretch-slim
MAINTAINER Syaiful Shah Zinan <ssz.planetjahit@gmail.com>

# system prep
RUN apt-get update \
&& apt-get install -y apt-transport-https lsb-release ca-certificates wget curl \
&& wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
&& apt-get update \
&& apt-get -y upgrade \

# tools
&& apt-get install -y vim zip unzip less wget curl apt-utils iputils-ping gnupg \

# nginx
&& apt-get install -y nginx \

# php
&& mkdir -p /run/php \
&& apt-get install -y php7.1 \
php7.1-fpm \
php7.1-mysql \
php7.1-dev \
php7.1-json \
php7.1-intl \
php7.1-mcrypt \
php7.1-curl \
php7.1-cli \
php7.1-xdebug \
php7.1-memcached \
php7.1-mbstring \
php7.1-zip \
php7.1-xml \
php7.1-gd \

# memcached
&& apt-get install -y memcached \

# composer
&& curl -sS https://getcomposer.org/installer | php \
&& mv composer.phar /usr/local/bin/composer

# define environment variable
ENV NAME devbox
ENV HOME /var/www
WORKDIR $HOME

# setup docker requirement data
# nginx
COPY    ./nginx/sites-enabled   /var/docker/nginx/sites-enabled
COPY    ./nginx/conf-stacks     /var/docker/nginx/conf-stacks

# setup ports
EXPOSE 80

# setup entrypoint script
COPY docker-entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
