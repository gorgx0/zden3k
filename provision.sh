#!/usr/bin/env bash

sed -i 's/.*\(en_GB.UTF-8 UTF-8\)/\1/' /etc/locale.gen
locale-gen
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
echo 'LANG=en_GB.UTF-8' >> /etc/environment
echo 'LANGUAGE=en_GB.UTF-8' >> /etc/environment
echo 'LC_ALL=en_GB.UTF-8' >> /etc/environment
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
  php7.0-sqlite3
