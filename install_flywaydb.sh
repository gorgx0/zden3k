#!/bin/sh

echo "Installing flyway"
rm -Rf  /usr/local/share/flyway /usr/local/bin/flyway

wget -q https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/5.1.4/flyway-commandline-5.1.4-linux-x64.tar.gz -O /tmp/flyway.tgz
cd /tmp
tar xzf flyway.tgz
mv /tmp/flyway-5.1.4 /usr/local/share/flyway
chmod a+x /usr/local/share/flyway/flyway
ln -s /usr/local/share/flyway/flyway /usr/local/bin/flyway
rm /tmp/flyway.tgz

echo "Flyway installed"