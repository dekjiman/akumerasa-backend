<?php

use CodeIgniter\Router\RouteCollection;

/** @var RouteCollection $routes */

$routes->get('/', function () {
    return [
        'name' => 'Refleksi Diri API',
        'version' => '1.0.0',
        'status' => 'running',
    ];
});

// Load modular routes
require ROOTPATH . 'Sites/Endpoint/Config/Routes.php';
