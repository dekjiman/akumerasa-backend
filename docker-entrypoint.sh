#!/bin/sh
set -e

# Auto-create writable directory structure if missing
echo "Ensuring writable directories exist..."
mkdir -p /var/www/html/writable/cache \
         /var/www/html/writable/logs \
         /var/www/html/writable/session \
         /var/www/html/writable/uploads \
         /var/www/html/writable/debugbar

# Set ownership and permissions for writable directory
chown -R www-data:www-data /var/www/html/writable
chmod -R 777 /var/www/html/writable

echo "Writable directories initialized successfully."

# Execute main container command
exec "$@"
