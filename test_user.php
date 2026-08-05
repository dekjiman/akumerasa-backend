<?php
$host = 'localhost';
$user = 'root';
$pass = '';
$db = 'refleksi_db';

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Hash password
$password = 'password';
$hashKey = 'refleksi-diri-hash-key-change-in-production';
$hash = password_verify($password . $hashKey, '$2y$10$test') ? 'verified' : 'needs_update';

// Generate proper hash
$properHash = password_hash($password . $hashKey, PASSWORD_BCRYPT);

// Insert user
$sql = "INSERT INTO users (name, email, password_hash, role, status, created_at, updated_at) 
        VALUES ('Admin', 'admin@refleksidiri.id', '$properHash', 'super_admin', 'active', NOW(), NOW()) 
        ON DUPLICATE KEY UPDATE password_hash='$properHash'";

if ($conn->query($sql) === TRUE) {
    echo "User created/updated successfully!\n";
    echo "Email: admin@refleksidiri.id\n";
    echo "Password: password\n";
    echo "Hash: $properHash\n";
} else {
    echo "Error: " . $conn->error . "\n";
}

$conn->close();
