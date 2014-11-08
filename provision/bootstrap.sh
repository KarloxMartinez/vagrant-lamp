sudo apt-get update
#instalamos Apache
echo "Install Apache"
sudo apt-get install -y apache2
sudo apt-get install apache2
sudo rm -rf /var/www
sudo ln -fs /res /var/www
# instalamos PHP5
echo "Install PHP5"
sudo apt-get install php5 libapache2-mod-php5 -y
# Reiniciamos el servidor web:
sudo /etc/init.d/apache2 restart
echo "ServerName localhost" | sudo tee /etc/apache2/sites-available/fqdn.conf
sudo ln -s /etc/apache2/sites-available/fqdn.conf /etc/apache2/sites-enabled/fqdn.conf
# Reiniciamos nuevamente el servidor web:
sudo /etc/init.d/apache2 restart
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'
# sudo apt-get -y install mysql-client mysql-server php5-mysql
# mysql -uroot -ppassword -e "CREATE DATABASE database;"