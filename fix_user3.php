<?php
$hashKey = 'J5yGAlg9l9qDqRC4YKjrULtZjn4zLzWCY38Eh9aaFxG';
$conn = new mysqli('localhost', 'root', '', 'refleksi_db');

$users = [
    ['id' => 3, 'email' => 'testuser@test.com', 'password' => 'admin'],
];

foreach ($users as $u) {
    $hash = password_hash($u['password'] . $hashKey, PASSWORD_BCRYPT);
    $stmt = $conn->prepare("UPDATE users SET password_hash = ? WHERE id = ?");
    $stmt->bind_param('si', $hash, $u['id']);
    $stmt->execute();
    echo "Updated {$u['email']} - hash: " . substr($hash, 0, 30) . "...\n";
}
$conn->close();
