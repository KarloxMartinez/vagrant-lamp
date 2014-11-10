#Buscamos actualizaciones
sudo apt-get update

#Instalamos Apache
echo "Install Apache"
sudo apt-get install -y apache2

#Instalamos PHP5
echo "Install PHP5"
sudo apt-get install -y php5 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-mysql

#Instalamos server MYSQL - root root
echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections
sudo apt-get -y install mysql-client mysql-server 



#Instalamos PHPMyAdmin
echo "Install PHPMyAdmin"
sudo apt-get install phpmyadmin
#mv /usr/share/phpmyadmin /var/www/

#Creamos los alias para que el server apache se redirecione a la carpeta res
sudo rm -rf /var/www
sudo ln -fs /res /var/www

sudo a2enmod rewrite
#Reiniciamos el server Apache
sudo service apache2 restart

mysql -uroot -proot -e "CREATE DATABASE PRUEBADESDESHELL;"