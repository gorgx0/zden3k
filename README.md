clone repo 
```
git clone -b development https://github.com/gorgx0/zden3k.git
cd zden3k
git submodule init
git submodule update
cd project/you-travel
git checkout html
```


start containers
```
docker-compose -f docker/docker-compose.yml up -d
```



create database
```
docker-compose -f docker/docker-compose.yml exec -T mariadb mysql -u root < database/create_user_and_db.sql
```

populate data 
```
docker-compose -f docker/docker-compose.yml exec -T mariadb mysql -u root YT < database/Hotels.dump.sql
```

get the latest data
```
docker-compose -f docker/docker-compose.yml exec -T mariadb mysql YT -u root < project/you-travel/YTx/sql/29072018YT.sql
```
to start debugging php server

```
http://localhost:8000/web/?XDEBUG_SESSION_START=youtravel
```

to debug php container
```
docker-compose -f docker/docker-compose.yml exec -T php apt install iputils-ping telnet && /bin/bash
docker-compose -f docker/docker-compose.yml exec  php /bin/bash
```