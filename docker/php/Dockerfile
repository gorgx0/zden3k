FROM debian:stretch-slim
RUN ["apt-get","update","-y"]
RUN ["apt-get", "install","-y" , "php7.0-cli","php7.0-xml", "php7.0-mysql", "php7.0-sqlite3", "php-xdebug"]
RUN printf "[xdebug]\nxdebug.remote_enable=1\nxdebug.remote_host=192.168.1.100\n" >> /etc/php/7.0/cli/conf.d/20-xdebug.ini
ENV XDEBUG_CONFIG="idkey=youtravel"
EXPOSE 8000/tcp
VOLUME ["/var/web"]
WORKDIR /var/web
ENTRYPOINT ["php","-S","0.0.0.0:8000"]



