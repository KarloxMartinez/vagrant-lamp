#Buscamos actualizaciones
sudo apt-get update
sudo apt-get -y upgrade

#Instalamos Apache
echo "Install Apache"
sudo apt-get install -y apache2 apache2-doc apache2-utils

#Instalamos PHP5
echo "Install PHP5"
sudo apt-get install -y php5 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-mysql

#Instalamos server MYSQL - root root
echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections
sudo apt-get -y install mysql-client mysql-server 
mysql -uroot -proot < /vagrant/bd.sql

#Instalamos PHPMyAdmin
echo "Install PHPMyAdmin"

sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password root'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password root'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password root'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2'﻿
sudo apt-get install -y phpmyadmin

#Creamos los alias para que el server apache se redirecione a la carpeta res
sudo rm -rf /var/www
sudo ln -fs /res /var/www

#Creamos los alias para que el server apache se redirecione a la carpeta res
sudo rm -rf /var/www
sudo ln -fs /res /var/www

#Host Virtual
sudo rm /etc/apache2/sites-available/default
sudo cp /vagrant/default /etc/apache2/sites-available
sudo a2enmod rewrite

#Reiniciamos los servicios
sudo service mysql restart
sudo service apache2 restart
