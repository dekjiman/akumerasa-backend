<?php
require 'vendor/autoload.php';

// Manually set the environment
$_SERVER['CI_ENVIRONMENT'] = 'development';

// Load dotenv
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

// Check if database config is loaded
echo "Database Host: " . ($_ENV['database.default.hostname'] ?? 'NOT SET') . "\n";
echo "Database Name: " . ($_ENV['database.default.database'] ?? 'NOT SET') . "\n";
echo "Database User: " . ($_ENV['database.default.username'] ?? 'NOT SET') . "\n";
