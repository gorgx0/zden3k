drop database  if exists YT;
create database YT ;
drop user if EXISTS 'YT'@'%';
create user 'YT'@'%'  identified by 'PASS' ;
grant all on YT.* to 'YT'@'%' ;
flush privileges ;