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
to start debugging 

```
http://localhost:8000/web/?XDEBUG_SESSION_START=youtravel
```
