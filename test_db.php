<?php
$db = new mysqli('localhost', 'root', '', 'refleksi_db');
if ($db->connect_error) {
    echo "Failed: " . $db->connect_error;
} else {
    echo "Connected successfully\n";
    $db->close();
}
