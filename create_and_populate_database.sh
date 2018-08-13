echo "Create YT database and user"
mysql < /vagrant/database/create_user_and_db.sql
echo "Populating YT database"
mysql YT < /project/you-travel/web/SQL/YTdb.sql
echo "open mariadb for network (BE CAREFULL - PASSWORDLESS ROOT ACCOUNT)"
sed -i -r -e 's/bind-address\s+=\s+[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
echo "restart mariadb server"
systemctl restart mariadb.service

