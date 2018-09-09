#!/usr/bin/env bash

# Install apache
apt-get update
apt-get install -y apache2

# Install PHP
apt-get install -y software-properties-common
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get install -y php5.6
apt-get install -y php5.6-xml
apt-get install -y libapache2-mod-php5.6

# Install Java
apt-get install -y openjdk-8-jre

# Install MySQL
debconf-set-selections <<< 'mysql-server mysql-server/root_password password admin'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password admin'
apt-get update
apt-get install -y mysql-server

# Import SIMILDROID database straight to mysql
mysqladmin create mydb --user=root --password=admin --host=127.0.0.1 --protocol=tcp
mysql -u root --password=admin mydb < /vagrant/SIMILDROID.sql

# Add Bitbucket host
ssh-keyscan -H bitbucket.org >> ~/.ssh/known_hosts

# Clone SIMILDROID repo
cd /var/www/html && rm -rf ..?* .[!.]* *
cd /var/www/html && git clone git@bitbucket.org:luiscabrero/simildroid.git .

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