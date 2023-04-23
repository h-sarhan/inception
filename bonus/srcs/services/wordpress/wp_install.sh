curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --path="/var/www/html/wordpress" --allow-root
wp config create --path="/var/www/html/wordpress" --allow-root --dbname=${DB_NAME} --dbuser=${ADMIN_NAME} --dbpass=${ADMIN_PASS} --dbhost=mariadb:3306
wp core install --path="/var/www/html/wordpress" --allow-root --url=hsarhan.42.fr --title=wordpress --admin_user=${ADMIN_NAME} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL}
chmod -R 755 /var/www/html/wordpress/wp-content
wp --path="/var/www/html/wordpress"  --allow-root plugin install redis-cache
wp --path="/var/www/html/wordpress"  --allow-root plugin activate redis-cache
wp --path="/var/www/html/wordpress"  --allow-root config set WP_CACHE_KEY_SALT hsarhan
wp --path="/var/www/html/wordpress"  --allow-root config set WP_CACHE true
wp --path="/var/www/html/wordpress"  --allow-root config set WP_REDIS_HOST redis
wp --path="/var/www/html/wordpress"  --allow-root config set WP_REDIS_PORT 6379
wp --path="/var/www/html/wordpress"  --allow-root config set WP_DEBUG true
wp --path="/var/www/html/wordpress"  --allow-root config set WP_DEBUG_LOG true
wp --path="/var/www/html/wordpress"  --allow-root redis enable