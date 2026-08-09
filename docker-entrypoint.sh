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

# Auto-generate .env file if it does not exist on deployment server
if [ ! -f /var/www/html/.env ]; then
    echo "Creating .env file from deployment environment variables..."
    cat <<EOF > /var/www/html/.env
CI_ENVIRONMENT = ${CI_ENVIRONMENT:-production}

app.baseURL = '${APP_BASE_URL:-http://localhost:8080/}'

database.default.hostname = ${DB_HOST:-db}
database.default.database = ${DB_NAME:-refleksi_db}
database.default.username = ${DB_USER:-refleksi_user}
database.default.password = ${DB_PASS:-refleksipass_2026#}
database.default.DBDriver = MySQLi
database.default.port = ${DB_PORT:-3306}

HASH_KEY = ${HASH_KEY:-J5yGAlg9l9qDqRC4YKjrULtZjn4zLzWCY38Eh9aaFxG}
JWT_SECRET = ${JWT_SECRET:-dev_secret_jwt_key_1234567890_akumerasa}
JWT_TIME_TO_LIVE = ${JWT_TIME_TO_LIVE:-86400}

XENDIT_SECRET_KEY = ${XENDIT_SECRET_KEY:-}
XENDIT_WEBHOOK_VERIFICATION_TOKEN = ${XENDIT_WEBHOOK_VERIFICATION_TOKEN:-}
EOF
    echo ".env file generated successfully."
fi

# Auto-install composer dependencies if vendor directory missing
if [ ! -d /var/www/html/vendor ]; then
    echo "Installing composer dependencies..."
    composer install --optimize-autoloader --no-interaction
fi

# Execute main container command
exec "$@"
