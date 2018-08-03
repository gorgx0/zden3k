#!/usr/bin/env bash

sed -i 's/.*\(en_GB.UTF-8 UTF-8\)/\1/' /etc/locale.gen
locale-gen
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
echo 'LANG=en_GB.UTF-8' >> /etc/environment
echo 'LANGUAGE=en_GB.UTF-8' >> /etc/environment
echo 'LC_ALL=en_GB.UTF-8' >> /etc/environment
timedatectl set-timezone   Europe/Warsaw
apt-get update
apt-get install -y \
  tmux \
  mc \
  vim \
  bash-completion \
  man \
  locate \
  unzip \
  git \
  tree \
  libapache2-mod-php7.0 \
  mariadb-server \
  mariadb-client \
  locate \
  mlocate \
  php-fpm \
  composer \
  php7.0-xml \
  php7.0-mysql \
  php7.0-sqlite3 \
  php-xdebug \
  curl

echo "Installing symfony tool"
printf "[xdebug]\nxdebug.idekey=youtravel\nxdebug.remote_enable=1\nxdebug.remote_host=10.0.2.2\n" >> /etc/php/7.0/cli/conf.d/20-xdebug.ini

curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
chmod a+x /usr/local/bin/symfony

echo "Installin teleconsole"
curl https://www.teleconsole.com/get.sh | sh
