FROM php:8.5-apache

# 1. Install dependensi sistem + git (penting untuk composer)
RUN apt-get update && apt-get install -y \
    libicu-dev \
    unzip \
    zip \
    git \
    && docker-php-ext-install intl pdo pdo_mysql mysqli pcntl

# 2. Install Composer (Alat untuk download CodeIgniter)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 3. Ubah Document Root Apache ke /public (Standar CI4)
# Ini agar saat buka localhost:8080, langsung masuk ke aplikasi, bukan daftar folder
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# 4. Aktifkan mod_rewrite
RUN a2enmod rewrite

WORKDIR /var/www/html
