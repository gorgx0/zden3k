FROM debian:stretch-slim
RUN ["apt-get","update","-y"]
RUN ["apt-get", "install","-y" , "php7.0-cli","php7.0-xml", "php7.0-mysql", "php7.0-sqlite3", "php-xdebug"]
EXPOSE 8000/tcp
VOLUME ["/var/web"]
WORKDIR /var/web
ENTRYPOINT ["php","-S","0.0.0.0:8000"]



