#!/usr/bin/env bash

# Install apache
apt-get update
apt-get install -y apache2

# Install PHP
apt-get install -y software-properties-common
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get install -y php5.6
apt-get install -y libapache2-mod-php5.6

# Install MySQL
debconf-set-selections <<< 'mysql-server mysql-server/root_password password admin'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password admin'
apt-get update
apt-get install -y mysql-server

# Import SIMILDROID database straight to mysql
mysqladmin create mydb --user=root --password=admin --host=127.0.0.1 --protocol=tcp
mysql -u root -p admin mydb < /vagrant/SIMILDROID.sql

echo '==================================================================================';
echo 'SIMILDROID WAS PROVISIONED! HAVE FUN!';
echo '==================================================================================';
echo '> Connect to the server using "vagrant ssh"';
echo '> Apache available in port 4567';
echo '> MySQL available in port 3333';
echo '> MySQL credentials:';
echo '> User: root';
echo '> Password: admin';
echo '> SIMILDROID is available on http://127.0.0.1:4567/ check it out! :)';
echo '==================================================================================';