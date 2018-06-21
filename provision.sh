#!/bin/sh

locale-gen en_UK.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales
apt-get update
apt-get install -y tmux mc vim  bash-completion man locate unzip git
apt-get install -y libapache2-mod-php7.0 mariadb-server mariadb-client locate mlocate php-fpm
apt-get install -y composer php7.0-xml
# php-pear
