create database youtravel ;
create user 'youtravel'@'%'  identified by 'PASS' ;
grant all on youtravel.* to 'youtravel'@'%' ;
flush privileges ;