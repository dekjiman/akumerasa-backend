<?php
require __DIR__ . '/vendor/codeigniter4/framework/system/bootstrap.php';

$db = \Config\Database::connect();
$cols = $db->getFieldData('hadiths');
echo "Columns in hadiths:\n";
foreach ($cols as $c) {
    echo "  {$c->name} ({$c->type})\n";
}
