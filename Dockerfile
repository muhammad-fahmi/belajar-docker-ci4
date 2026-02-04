# 1. Gunakan 'image' dasar PHP dengan Apache
FROM php:8.1-apache

# 2. Install dependensi sistem yang dibutuhkan CodeIgniter 4
RUN apt-get update && apt-get install -y \
    libicu-dev \
    unzip \
    zip \
    && docker-php-ext-install intl pdo pdo_mysql

# 3. Aktifkan mod_rewrite (Penting untuk URL CodeIgniter)
RUN a2enmod rewrite

# 4. Atur folder kerja di dalam container
WORKDIR /var/www/html

# 5. Salin kodingan dari folder 'src' komputer kita ke dalam container
COPY src/ /var/www/html/

# 6. Berikan hak akses agar Apache bisa baca tulis
RUN chown -R www-data:www-data /var/www/html
