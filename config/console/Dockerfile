FROM php:7.0

ENV PHP_EXTRA_CONFIGURE_ARGS --enable-intl --enable-opcache --enable-zip

RUN apt-get update

RUN \
  apt-get install -y \
  libcurl4-gnutls-dev \
  libxml2-dev \
  libssl-dev

RUN \
    /usr/local/bin/docker-php-ext-install \
    dom \
    pcntl \
    phar \
    posix

# Configure PHP
# php module build deps
RUN \
  apt-get install -y \
  g++ \
  autoconf \
  libbz2-dev \
  libltdl-dev \
  libpng12-dev \
  libjpeg62-turbo-dev \
  libfreetype6-dev \
  libxpm-dev \
  libimlib2-dev \
  libicu-dev \
  libmcrypt-dev \
  libxslt1-dev \

  re2c \
  libpng++-dev \
  libpng3 \
  libvpx-dev \
  zlib1g-dev \
  libgd-dev \
  libtidy-dev \
  libmagic-dev \
  libexif-dev \
  file \
  libssh2-1-dev \
  libjpeg-dev \
  git \
  curl \
  wget \
  librabbitmq-dev \
  libzip-dev \
  libzip2

# http://devdocs.magento.com/guides/v2.0/install-gde/system-requirements.html
RUN \
    /usr/local/bin/docker-php-ext-install \
    pdo \
    sockets \
    pdo_mysql \
    mysqli \
    mbstring \
    mcrypt \
    hash \
    simplexml \
    xsl \
    soap \
    intl \
    bcmath \
    json \
    opcache \
    zip

RUN docker-php-ext-configure gd --with-freetype-dir=/usr --with-jpeg-dir=/usr --with-png-dir=/usr \
    && docker-php-ext-install gd

RUN curl -O https://files.magerun.net/n98-magerun.phar && \
    chmod +x n98-magerun.phar && \
    mv n98-magerun.phar /usr/local/bin/magerun

ADD config/php/php.ini /usr/local/etc/php/php.ini

RUN apt-get install -qy mysql-client unzip

WORKDIR /var/www/html
ENTRYPOINT [ "/usr/bin/env", "magerun" ]
