<?php

/** @var CodeIgniter\Router\RouteCollection $routes */

// CORS preflight
$routes->options('(:any)', '', ['filter' => 'cors']);

/*
|--------------------------------------------------------------------------
| Auth Routes (Public)
|--------------------------------------------------------------------------
*/
$routes->group('endpoint/auth', ['namespace' => 'Sites\Endpoint\Controllers\Auth'], function ($routes) {
    $routes->post('login', 'Auth::login');
    $routes->post('register', 'Auth::register');
    $routes->post('verify-email', 'Auth::verifyEmail');
    $routes->post('forgot-password', 'Auth::forgotPassword');
    $routes->post('reset-password', 'Auth::resetPassword');
    $routes->post('resend-verification', 'Auth::resendVerification');
    $routes->post('device/login', 'Auth::deviceLogin');
    $routes->post('device/activate', 'Auth::deviceActivate');
    $routes->post('refresh', 'Auth::refresh');
    $routes->get('me', 'Auth::me', ['filter' => 'jwtFilterAuth']);
    $routes->get('my-permissions', 'Auth::myPermissions', ['filter' => 'jwtFilterAuth']);
    $routes->post('logout', 'Auth::logout', ['filter' => 'jwtFilterAuth']);
});

/*
|--------------------------------------------------------------------------
| Admin Routes (JWT Required)
|--------------------------------------------------------------------------
*/
$routes->group('endpoint/admin', ['namespace' => 'Sites\Endpoint\Controllers\Admin', 'filter' => 'jwtFilterAuth'], function ($routes) {
    // Tenants
    $routes->get('tenants', 'Tenants::index', ['filter' => 'rbac:tenants.view']);
    $routes->post('tenants', 'Tenants::create', ['filter' => 'rbac:tenants.create']);
    $routes->get('tenants/(:num)', 'Tenants::show/$1', ['filter' => 'rbac:tenants.view']);
    $routes->put('tenants/(:num)', 'Tenants::update/$1', ['filter' => 'rbac:tenants.update']);
    $routes->delete('tenants/(:num)', 'Tenants::delete/$1', ['filter' => 'rbac:tenants.delete']);
    $routes->post('tenants/(:num)/submit', 'Tenants::submit/$1', ['filter' => 'rbac:tenants.update']);
    $routes->post('tenants/(:num)/approve', 'Tenants::approve/$1', ['filter' => 'rbac:tenants.approve']);
    $routes->post('tenants/(:num)/request-revision', 'Tenants::requestRevision/$1', ['filter' => 'rbac:tenants.approve']);
    $routes->post('tenants/(:num)/reject', 'Tenants::reject/$1', ['filter' => 'rbac:tenants.approve']);

    // Locations
    $routes->get('locations', 'Locations::index', ['filter' => 'rbac:locations.view']);
    $routes->post('locations', 'Locations::create', ['filter' => 'rbac:locations.create']);
    $routes->get('locations/(:num)', 'Locations::show/$1', ['filter' => 'rbac:locations.view']);
    $routes->put('locations/(:num)', 'Locations::update/$1', ['filter' => 'rbac:locations.update']);
    $routes->delete('locations/(:num)', 'Locations::delete/$1', ['filter' => 'rbac:locations.delete']);
    $routes->post('locations/(:num)/submit', 'Locations::submit/$1', ['filter' => 'rbac:locations.update']);
    $routes->post('locations/(:num)/approve', 'Locations::approve/$1', ['filter' => 'rbac:locations.update']);

    // Kiosks
    $routes->get('kiosks', 'Kiosks::index', ['filter' => 'rbac:kiosks.view']);
    $routes->post('kiosks', 'Kiosks::create', ['filter' => 'rbac:kiosks.create']);
    $routes->get('kiosks/(:num)', 'Kiosks::show/$1', ['filter' => 'rbac:kiosks.view']);
    $routes->put('kiosks/(:num)', 'Kiosks::update/$1', ['filter' => 'rbac:kiosks.update']);
    $routes->delete('kiosks/(:num)', 'Kiosks::delete/$1', ['filter' => 'rbac:kiosks.delete']);
    $routes->get('kiosks/(:num)/heartbeats', 'Kiosks::heartbeats/$1', ['filter' => 'rbac:kiosks.view']);
    $routes->post('kiosks/(:num)/regenerate-token', 'Kiosks::regenerateToken/$1', ['filter' => 'rbac:kiosks.update']);
    $routes->post('kiosks/(:num)/activation-codes', 'Kiosks::generateActivationCode/$1', ['filter' => 'rbac:kiosks.activate']);
    $routes->post('kiosks/(:num)/activation-codes/revoke', 'Kiosks::revokeActivationCodes/$1', ['filter' => 'rbac:kiosks.revoke']);
    $routes->get('kiosks/(:num)/activation-codes', 'Kiosks::activationHistory/$1', ['filter' => 'rbac:kiosks.view']);

    // Kiosk Requests
    $routes->get('kiosk-requests', 'KioskRequests::index', ['filter' => 'rbac:kiosk_requests.view']);
    $routes->post('kiosk-requests', 'KioskRequests::create', ['filter' => 'rbac:kiosk_requests.create']);
    $routes->get('kiosk-requests/(:num)', 'KioskRequests::show/$1', ['filter' => 'rbac:kiosk_requests.view']);
    $routes->put('kiosk-requests/(:num)', 'KioskRequests::update/$1', ['filter' => 'rbac:kiosk_requests.create']);
    $routes->delete('kiosk-requests/(:num)', 'KioskRequests::delete/$1', ['filter' => 'rbac:kiosk_requests.create']);
    $routes->post('kiosk-requests/(:num)/approve', 'KioskRequests::approve/$1', ['filter' => 'rbac:kiosk_requests.approve']);
    $routes->post('kiosk-requests/(:num)/reject', 'KioskRequests::reject/$1', ['filter' => 'rbac:kiosk_requests.reject']);

    // Users
    $routes->get('users', 'Users::index', ['filter' => 'rbac:users.view']);
    $routes->post('users', 'Users::create', ['filter' => 'rbac:users.create']);
    $routes->get('users/(:num)', 'Users::show/$1', ['filter' => 'rbac:users.view']);
    $routes->put('users/(:num)', 'Users::update/$1', ['filter' => 'rbac:users.update']);
    $routes->delete('users/(:num)', 'Users::delete/$1', ['filter' => 'rbac:users.delete']);

    // Roles
    $routes->get('roles', 'Roles::index', ['filter' => 'rbac:roles.view']);
    $routes->get('roles/(:num)/permissions', 'Roles::permissions/$1', ['filter' => 'rbac:roles.view']);
    $routes->put('roles/(:num)/permissions', 'Roles::updatePermissions/$1', ['filter' => 'rbac:roles.manage']);

    // Content - Emotions
    $routes->get('content/emotions', 'Content::emotions', ['filter' => 'rbac:content.view']);
    $routes->post('content/emotions', 'Content::createEmotion', ['filter' => 'rbac:content.create']);
    $routes->put('content/emotions/(:num)', 'Content::updateEmotion/$1', ['filter' => 'rbac:content.update']);
    $routes->delete('content/emotions/(:num)', 'Content::deleteEmotion/$1', ['filter' => 'rbac:content.delete']);

    // Content - Contexts
    $routes->get('content/contexts', 'Content::contexts', ['filter' => 'rbac:content.view']);
    $routes->post('content/contexts', 'Content::createContext', ['filter' => 'rbac:content.create']);
    $routes->put('content/contexts/(:num)', 'Content::updateContext/$1', ['filter' => 'rbac:content.update']);
    $routes->delete('content/contexts/(:num)', 'Content::deleteContext/$1', ['filter' => 'rbac:content.delete']);

    // Content - Quran Verses
    $routes->get('content/quran', 'Content::quranVerses', ['filter' => 'rbac:content.view']);
    $routes->post('content/quran', 'Content::createQuranVerse', ['filter' => 'rbac:content.create']);
    $routes->put('content/quran/(:num)', 'Content::updateQuranVerse/$1', ['filter' => 'rbac:content.update']);
    $routes->delete('content/quran/(:num)', 'Content::deleteQuranVerse/$1', ['filter' => 'rbac:content.delete']);
    $routes->put('content/quran/(:num)/review', 'Content::reviewQuranVerse/$1', ['filter' => 'rbac:content.update']);

    // Content - Hadiths
    $routes->get('content/hadith', 'Content::hadiths', ['filter' => 'rbac:content.view']);
    $routes->post('content/hadith', 'Content::createHadith', ['filter' => 'rbac:content.create']);
    $routes->put('content/hadith/(:num)', 'Content::updateHadith/$1', ['filter' => 'rbac:content.update']);
    $routes->delete('content/hadith/(:num)', 'Content::deleteHadith/$1', ['filter' => 'rbac:content.delete']);
    $routes->put('content/hadith/(:num)/review', 'Content::reviewHadith/$1', ['filter' => 'rbac:content.update']);

    // Campaigns
    $routes->get('campaigns', 'Campaigns::index', ['filter' => 'rbac:campaigns.view']);
    $routes->post('campaigns', 'Campaigns::create', ['filter' => 'rbac:campaigns.create']);
    $routes->get('campaigns/(:num)', 'Campaigns::show/$1', ['filter' => 'rbac:campaigns.view']);
    $routes->put('campaigns/(:num)', 'Campaigns::update/$1', ['filter' => 'rbac:campaigns.update']);
    $routes->delete('campaigns/(:num)', 'Campaigns::delete/$1', ['filter' => 'rbac:campaigns.delete']);

    // Donations
    $routes->get('donations', 'Donations::index', ['filter' => 'rbac:donations.view']);
    $routes->get('donations/(:num)', 'Donations::show/$1', ['filter' => 'rbac:donations.view']);
    $routes->post('donations/(:num)/cancel', 'Donations::cancel/$1', ['filter' => 'rbac:donations.manage']);

    // Reports
    $routes->get('reports/overview', 'Reports::overview', ['filter' => 'rbac:tenants.view']);
    $routes->get('reports/sessions', 'Reports::sessions', ['filter' => 'rbac:tenants.view']);
    $routes->get('reports/donations', 'Reports::donations', ['filter' => 'rbac:donations.view']);

    // Audit Logs
    $routes->get('audit', 'AuditLogs::index', ['filter' => 'rbac:audit.view']);
    $routes->get('audit/(:num)', 'AuditLogs::show/$1', ['filter' => 'rbac:audit.view']);
});

/*
|--------------------------------------------------------------------------
| Kiosk Routes (Device Auth Required)
|--------------------------------------------------------------------------
*/
$routes->group('endpoint/kiosk', ['namespace' => 'Sites\Endpoint\Controllers\Kiosk', 'filter' => 'kioskAuth'], function ($routes) {
    $routes->post('heartbeat', 'Kiosk::heartbeat');
    $routes->get('config', 'Kiosk::config');
    $routes->get('manifest', 'Kiosk::manifest');
    $routes->get('static-qr', 'Kiosk::staticQR');

    // Sessions
    $routes->post('sessions', 'Sessions::create');
    $routes->get('sessions/(:any)', 'Sessions::show/$1');
    $routes->put('sessions/(:any)', 'Sessions::update/$1');
    $routes->post('sessions/(:any)/complete', 'Sessions::complete/$1');

    // Print Jobs
    $routes->post('sessions/(:any)/print', 'PrintJobs::create/$1');
    $routes->get('print-jobs/pending', 'PrintJobs::pending');
    $routes->get('print-jobs/(:any)', 'PrintJobs::show/$1');
    $routes->put('print-jobs/(:any)/status', 'PrintJobs::updateStatus/$1');
});

/*
|--------------------------------------------------------------------------
| Public Routes
|--------------------------------------------------------------------------
*/
$routes->get('t/(:any)', '\Sites\Endpoint\Controllers\Public\QrResult::show/$1');
$routes->post('endpoint/public/donasi', '\Sites\Endpoint\Controllers\Public\Donasi::create', ['filter' => 'throttle']);
$routes->get('endpoint/public/payment-status/(:any)', '\Sites\Endpoint\Controllers\Public\PaymentStatus::check/$1');

/*
|--------------------------------------------------------------------------
| Webhook Routes
|--------------------------------------------------------------------------
*/
$routes->post('endpoint/webhook/payment', '\Sites\Endpoint\Controllers\Webhook\Payment::handle', ['filter' => 'throttle']);
