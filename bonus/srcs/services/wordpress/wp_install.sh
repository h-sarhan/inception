mv /inception /var/www/html/
chmod -R 0755  /var/www/html
chown -R www-data:www-data  /var/www/html
wp core install --path="/var/www/html/wordpress" --allow-root \
    --url=hsarhan.42.fr --title=wordpress --admin_user=${ADMIN_NAME} \
    --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL}
wp --path="/var/www/html/wordpress"  --allow-root plugin install redis-cache
wp --path="/var/www/html/wordpress"  --allow-root plugin activate redis-cache
wp --path="/var/www/html/wordpress"  --allow-root redis enable
