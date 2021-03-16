FROM php:8.0.3-fpm

LABEL maintainer="geosony@gmail.com"

RUN apt-get update && apt-get install -y \
    openssl \
    git

RUN apt-get update \
	&& apt-get install -y libicu-dev \
	&& docker-php-ext-configure intl \
	&& docker-php-ext-install -j$(nproc) intl

RUN apt-get update \
    && apt-get install -y libonig-dev libpq-dev \
    && docker-php-ext-install -j$(nproc) pdo pdo_pgsql mbstring

RUN apt-get update \
	&& apt-get install -y \
	libbz2-dev \
	zlib1g-dev \
	libzip-dev \
	&& docker-php-ext-install -j$(nproc) \
		zip \
		bz2

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
