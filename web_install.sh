#!/usr/bin/env bash

sudo apt update
sudo apt install apache2

sudo ufw allow in "Apache Full"

sudo apt install mysql-server -y
sudo mysql_secure_installation

sudo apt install php libapache2-mod-php php-mysql -y

location=/etc/apache2/mods-enabled/dir.conf

cat > $location <<EOL
<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
EOL

sudo systemctl restart apache2

sudo apt install php-cli

#Virtual Hosting Setup
#
your_domain=test_site
#
sudo mkdir /var/www/$your_domain
sudo chown -R $USER:$USER /var/www/$your_domain
sudo chmod -R 755 /var/www/$your_domain
#
sudo cat > /var/www/$your_domain/index.html <<EOL
<html>
    <head>
        <title>Welcome to $your_domain!</title>
    </head>
    <body>
        <h1>Success! The $your_domain server block is working!</h1>
    </body>
</html>
