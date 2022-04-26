#!/bin/bash

sudo dpkg --configure -a
sudo chmod +x variables.sh
source variables.sh

# updates the server
echo
echo "Updating the system...."
echo
sudo apt-get update -y
echo
echo "Update completed......."
echo
sleep 1

# install php and composer
echo
echo "Installing PHP...."
echo
sudo apt install php-fpm php-mysql -y
sudo apt-get install composer -y
sudo apt install php7.4-cli php7.4-fpm php7.4-json php7.4-pdo php7.4-mysql php7.4-zip php7.4-gd  php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath php7.4-json -y
echo
echo "PHP installation Completed..."
echo
sleep 1

# Mysql configurations
echo
sudo chmod +x mysql.sh
source mysql.sh
echo
sleep 1

# Nginx Install
echo
echo "Installing Nginx and Final Setup...."
echo
sudo apt-get install nginx -y
sudo ufw allow 'Nginx HTTP'
echo
echo
sleep 1

#clone project and configure
echo
echo "clone and configure the project..."
echo
sudo chmod -R 777 /var/www/html
pushd /var/www/html 
git clone -b $BRNACHNAME $GITURL
sudo chmod -R 755 /var/www/html/
sudo chown -R $USER:$USER /var/www/html/$PROJECTNAME
cd /var/www/html/$PROJECTNAME
cd storage/ && mkdir -p framework/{sessions,views,cache} && chmod -R 775 framework && cd ..
composer install
sudo rm -r .env
echo
sleep 1
#set environment values
popd 
sudo chmod +x environment.sh
source environment.sh
echo
echo
sleep 1
#run the artisan commands
pushd /var/www/html/$PROJECTNAME
php artisan migrate
php artisan db:seed
php artisan optimize:clear
sudo chown -R www-data.www-data storage
sudo chown -R www-data.www-data bootstrap
echo
echo "clone and configuration completed..."
sleep 1

# Nginx Configurations
cd
cd autodep
sudo chmod +x nginx.sh
source nginx.sh
sudo nginx -test
sudo systemctl restart nginx

#other Operations
sudo apt-get update
# sudo rm -r automated_setup.sh nginx.sh environment.sh

echo "setup completed"
