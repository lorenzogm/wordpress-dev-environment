# Init script for VVV Auto Bootstrap

echo "Commencing VVV Auto Bootstrap"

# Make a database, if we don't already have one
echo "Creating database (if it's not already there)"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS lorenzogm"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON lorenzogm.* TO lorenzogm@localhost IDENTIFIED BY 'lorenzogm';"

# Run Composer
composer install --prefer-dist

# Download WordPress
if [ ! -f htdocs/wp-config.php ]
then
	echo "Creating wp-config.php and installing WordPress"
	wp core config --dbname="lorenzogm" --dbuser=lorenzogm --dbpass=lorenzogm --dbhost="localhost" --extra-php <<PHP
define( 'WP_CONTENT_DIR', dirname(__FILE__) . '/wp-content/' );
PHP
	mv htdocs/wordpress/wp-config.php htdocs/
	wp core install --url=lorenzogm.local --title="lorenzogm" --admin_user=admin --admin_password=admin --admin_email=admin@email.com
	wp option update permalink_structure "/%year%/%monthnum%/%postname%/"
fi

sudo apt-get install -yqq ruby-dev

echo "Setting up Wordmove..."
sudo gem install wordmove

# The Vagrant site setup script will restart Nginx for us

echo "VVV Auto Bootstrap has finished"
