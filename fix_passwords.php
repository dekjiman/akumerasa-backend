<?php
require __DIR__ . '/vendor/autoload.php';

$hashKey = 'J5yGAlg9l9qDqRC4YKjrULtZjn4zLzWCY38Eh9aaFxG';
echo "Using HASH_KEY: $hashKey\n";

$conn = new mysqli('localhost', 'root', '', 'refleksi_db');

$users = [
    ['id' => 1, 'email' => 'admin@refleksidiri.id', 'password' => 'admin'],
    ['id' => 2, 'email' => 'admin@refleksi.app', 'password' => 'admin'],
];

foreach ($users as $u) {
    $hash = password_hash($u['password'] . $hashKey, PASSWORD_BCRYPT);
    $sql = "UPDATE users SET password_hash = ?, login_attempts = 0, locked_until = NULL WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('si', $hash, $u['id']);
    if ($stmt->execute()) {
        echo "Updated {$u['email']} (id={$u['id']}) - password: {$u['password']}\n";
    } else {
        echo "FAILED: {$u['email']} - {$conn->error}\n";
    }
}
$conn->close();
