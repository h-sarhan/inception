# Move static website into volume
mv /inception /var/www/html/
# Set permissions and ownership
chmod -R 0755  /var/www/html
chown -R www-data:www-data  /var/www/html
# Set wordpress database credentials in config file
wp --path="/var/www/html/wordpress"  --allow-root config set DB_USER ${ADMIN_NAME}
wp --path="/var/www/html/wordpress"  --allow-root config set DB_PASSWORD ${ADMIN_PASS}
# Install wordpress locally
wp core install --path="/var/www/html/wordpress" --allow-root \
    --url=hsarhan.42.fr --title=wordpress --admin_user=${ADMIN_NAME} \
    --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL}
# Install and enable wordpress plugins
wp --path="/var/www/html/wordpress"  --allow-root plugin install redis-cache
wp --path="/var/www/html/wordpress"  --allow-root plugin activate redis-cache
wp --path="/var/www/html/wordpress"  --allow-root redis enable
