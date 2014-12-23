# Init script for VVV Auto Bootstrap

echo "Commencing VVV Auto Bootstrap"

# Make a database, if we don't already have one
echo "Creating database (if it's not already there)"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS elegantdev"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON elegantdev.* TO elegantdev@localhost IDENTIFIED BY 'elegantdev';"

# Run Composer
composer install --prefer-dist

# Download WordPress
if [ ! -f htdocs/wp-config.php ]
then
	echo "Creating wp-config.php and installing WordPress"
	wp core config --dbname="elegantdev" --dbuser=elegantdev --dbpass=elegantdev --dbhost="localhost"
	mv htdocs/wordpress/wp-config.php htdocs/
	cp htdocs/wp-config-sample.php htdocs/wp-config.php
	wp core install --url=elegantdev.local --title="elegantdev" --admin_user=admin --admin_password=admin --admin_email=dev@email.com
	wp option update permalink_structure "/%year%/%monthnum%/%postname%/"
fi

sudo apt-get install -yqq ruby-dev

echo "Setting up Wordmove..."
sudo gem install wordmove

# The Vagrant site setup script will restart Nginx for us

echo "VVV Auto Bootstrap has finished"
