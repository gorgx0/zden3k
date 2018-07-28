create database YT ;
create user 'YT'@'%'  identified by 'PASS' ;
grant all on YT.* to 'YT'@'%' ;
flush privileges ;