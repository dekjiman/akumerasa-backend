<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;

class Cors extends BaseConfig
{
    public array $default = [
        'allowedOrigins' => [
            'http://localhost:5173',
            'http://localhost:5174',
            'http://localhost:3002',
            'http://localhost:8080',
            'https://localhost',
            'http://localhost',
            'capacitor://localhost',
        ],

        'allowedOriginsPatterns' => [],

        'supportsCredentials' => false,

        'allowedHeaders' => [
            'Content-Type',
            'Authorization',
            'X-Refresh-Token',
            'X-Device-Fingerprint',
        ],

        'exposedHeaders' => [
            'X-New-Token',
        ],

        'allowedMethods' => [
            'GET',
            'POST',
            'PUT',
            'DELETE',
            'PATCH',
            'OPTIONS',
        ],

        'maxAge' => 7200,
    ];
}
