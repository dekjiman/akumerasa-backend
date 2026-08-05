<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;

class Xendit extends BaseConfig
{
    public string $apiKey = '';
    public string $webhookToken = '';
    public string $webhookSecret = '';
    public string $environment = 'development';
    public string $apiBaseUrl = 'https://api.xendit.co';

    public array $bankCodes = [
        'bca'      => 'BCA',
        'bri'      => 'BRI',
        'bni'      => 'BNI',
        'mandiri'  => 'MANDIRI',
        'bsi'      => 'BSI',
        'permata'  => 'PERMATA',
        'muamalat' => 'MUAMALAT',
        'bjb'      => 'BJB',
        'bnc'      => 'BNC',
        'bss'      => 'SAHABAT_SAMPOERNA',
    ];

    public array $paymentMethods = [
        'qris'         => 'QRIS',
        'va_bri'       => 'BRI Virtual Account',
        'va_bni'       => 'BNI Virtual Account',
        'va_mandiri'   => 'Mandiri Virtual Account',
        'va_bsi'       => 'BSI Virtual Account',
        'va_permata'   => 'Permata Virtual Account',
        'va_muamalat'  => 'Muamalat Virtual Account',
        'va_bjb'       => 'BJB Virtual Account',
        'va_bnc'       => 'BNC Virtual Account',
        'va_bss'       => 'BSS Virtual Account',
    ];

    public int $qrisMinAmount = 1500;
    public int $qrisMaxAmount = 10000000;
    public int $vaMinAmount = 10000;
    public int $vaMaxAmount = 50000000;
    public int $paymentExpiryHours = 24;
}
