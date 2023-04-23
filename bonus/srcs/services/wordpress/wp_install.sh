curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html/wordpress
wp core download --path="/var/www/html/wordpress" --allow-root
wp config create --path="/var/www/html/wordpress" --allow-root --dbname=${DB_NAME} --dbuser=${ADMIN_NAME} --dbpass=${ADMIN_PASS} --dbhost=mariadb:3306
wp core install --path="/var/www/html/wordpress" --allow-root --url=hsarhan.42.fr --title=wordpress --admin_user=${ADMIN_NAME} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL}
chmod -R 755 ./wp-content