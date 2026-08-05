<?php
/**
 * Comprehensive Backend CRUD Test Script v2
 * Tests all admin endpoints
 */

$baseUrl = 'http://localhost:8080';
$token = null;

function request($method, $url, $body = null, $extraHeaders = []) {
    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CUSTOMREQUEST => $method,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_HTTPHEADER => array_merge(['Content-Type: application/json'], $extraHeaders),
    ]);
    if ($body) {
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($body));
    }
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    $decoded = json_decode($response, true);
    return ['status' => $httpCode, 'body' => $decoded, 'raw' => $response];
}

function authHeaders($token) {
    return ["Authorization: Bearer $token"];
}

$passCount = 0;
$failCount = 0;

function test($name, $result, $expectedStatus = null, $expectSuccess = true) {
    global $passCount, $failCount;
    $status = $result['status'];
    $success = $result['body']['success'] ?? null;
    $msg = $result['body']['message'] ?? '';
    
    $pass = true;
    $reason = '';
    
    if ($expectedStatus && $status !== $expectedStatus) {
        $pass = false;
        $reason = "Expected HTTP $expectedStatus, got $status";
    }
    if ($expectSuccess && $success !== true) {
        $pass = false;
        if (!$reason) $reason = "success=false: $msg";
    }
    
    if ($pass) {
        $passCount++;
        echo "  [PASS] $name\n";
    } else {
        $failCount++;
        echo "  [FAIL] $name - $reason\n";
        $detail = substr(json_encode($result['body']), 0, 200);
        echo "         $detail\n";
    }
    
    return $pass;
}

echo "========================================\n";
echo "  REFLekSI BACKEND CRUD TEST v2\n";
echo "========================================\n\n";

// ============ AUTH ============
echo "[AUTH]\n";
$r = request('POST', "$baseUrl/endpoint/auth/login", ['email' => 'admin@refleksidiri.id', 'password' => 'admin']);
test('Login', $r, 200);
if ($r['body']['success']) {
    $token = $r['body']['data']['token'];
    $refreshToken = $r['body']['data']['refresh_token'];
} else {
    echo "\nFATAL: Login failed. Aborting.\n";
    exit(1);
}
$headers = authHeaders($token);

$r = request('GET', "$baseUrl/endpoint/auth/me", null, $headers);
test('Get Me', $r, 200);

$r = request('POST', "$baseUrl/endpoint/auth/refresh", null, ["X-Refresh-Token: $refreshToken"]);
test('Refresh Token', $r, 200);
if ($r['body']['success']) {
    $token = $r['body']['data']['token'];
    $headers = authHeaders($token);
}

$r = request('POST', "$baseUrl/endpoint/auth/logout", null, $headers);
test('Logout', $r, 200);

// Re-login
$r = request('POST', "$baseUrl/endpoint/auth/login", ['email' => 'admin@refleksidiri.id', 'password' => 'admin']);
$token = $r['body']['data']['token'];
$headers = authHeaders($token);

// ============ TENANTS ============
echo "\n[TENANTS]\n";
$r = request('GET', "$baseUrl/endpoint/admin/tenants", null, $headers);
test('List Tenants', $r, 200);

$r = request('POST', "$baseUrl/endpoint/admin/tenants", [
    'name' => 'Test Masjid CRUD', 'contact_name' => 'Budi', 'contact_email' => 'budi@test.com'
], $headers);
test('Create Tenant', $r, 201);
$tenantId = $r['body']['data']['id'] ?? null;

if ($tenantId) {
    $r = request('GET', "$baseUrl/endpoint/admin/tenants/$tenantId", null, $headers);
    test('Show Tenant', $r, 200);

    $r = request('PUT', "$baseUrl/endpoint/admin/tenants/$tenantId", ['name' => 'Test Masjid Updated'], $headers);
    test('Update Tenant', $r, 200);

    $r = request('DELETE', "$baseUrl/endpoint/admin/tenants/$tenantId", null, $headers);
    test('Delete Tenant', $r, 200);
}

// ============ LOCATIONS ============
echo "\n[LOCATIONS]\n";
$r = request('GET', "$baseUrl/endpoint/admin/locations", null, $headers);
test('List Locations', $r, 200);

$r = request('POST', "$baseUrl/endpoint/admin/locations", [
    'tenant_id' => $tenantId ?? 1, 'name' => 'Masjid Test CRUD', 'address' => 'Jl. Test No.1',
    'city' => 'Jakarta', 'province' => 'DKI Jakarta'
], $headers);
test('Create Location', $r, 201);
$locationId = $r['body']['data']['id'] ?? null;

if ($locationId) {
    $r = request('GET', "$baseUrl/endpoint/admin/locations/$locationId", null, $headers);
    test('Show Location', $r, 200);

    $r = request('PUT', "$baseUrl/endpoint/admin/locations/$locationId", ['name' => 'Masjid Updated'], $headers);
    test('Update Location', $r, 200);

    $r = request('DELETE', "$baseUrl/endpoint/admin/locations/$locationId", null, $headers);
    test('Delete Location', $r, 200);
}

// ============ KIOSKS ============
echo "\n[KIOSKS]\n";
$r = request('GET', "$baseUrl/endpoint/admin/kiosks", null, $headers);
test('List Kiosks', $r, 200);

$r = request('POST', "$baseUrl/endpoint/admin/kiosks", [
    'kiosk_code' => 'KSK-TEST-001', 'location_id' => $locationId ?? 1, 'tenant_id' => $tenantId ?? 1
], $headers);
test('Create Kiosk', $r, 201);
$kioskId = $r['body']['data']['id'] ?? null;

if ($kioskId) {
    $r = request('GET', "$baseUrl/endpoint/admin/kiosks/$kioskId", null, $headers);
    test('Show Kiosk', $r, 200);

    $r = request('PUT', "$baseUrl/endpoint/admin/kiosks/$kioskId", ['status' => 'active'], $headers);
    test('Update Kiosk', $r, 200);

    $r = request('GET', "$baseUrl/endpoint/admin/kiosks/$kioskId/heartbeats", null, $headers);
    test('Kiosk Heartbeats', $r, 200);

    $r = request('POST', "$baseUrl/endpoint/admin/kiosks/$kioskId/regenerate-token", null, $headers);
    test('Regenerate Token', $r, 200);

    $r = request('DELETE', "$baseUrl/endpoint/admin/kiosks/$kioskId", null, $headers);
    test('Delete Kiosk', $r, 200);
}

// ============ USERS ============
echo "\n[USERS]\n";
$r = request('GET', "$baseUrl/endpoint/admin/users", null, $headers);
test('List Users', $r, 200);

$r = request('POST', "$baseUrl/endpoint/admin/users", [
    'name' => 'Test User', 'email' => 'testuser@refleksi.test', 'password' => 'password123', 'role' => 'mosque_admin'
], $headers);
test('Create User', $r, 201);
$userId = $r['body']['data']['id'] ?? null;

if ($userId) {
    $r = request('GET', "$baseUrl/endpoint/admin/users/$userId", null, $headers);
    test('Show User', $r, 200);

    $r = request('PUT', "$baseUrl/endpoint/admin/users/$userId", ['name' => 'Test User Updated'], $headers);
    test('Update User', $r, 200);

    $r = request('DELETE', "$baseUrl/endpoint/admin/users/$userId", null, $headers);
    test('Delete User', $r, 200);
}

// ============ ROLES ============
echo "\n[ROLES]\n";
$r = request('GET', "$baseUrl/endpoint/admin/roles", null, $headers);
test('List Roles', $r, 200);

if (isset($r['body']['data'][0]['id'])) {
    $roleId = $r['body']['data'][0]['id'];
    $r = request('GET', "$baseUrl/endpoint/admin/roles/$roleId/permissions", null, $headers);
    test('Show Permissions', $r, 200);

    $r = request('PUT', "$baseUrl/endpoint/admin/roles/$roleId/permissions", ['permissions' => ['tenants.view', 'locations.view']], $headers);
    test('Update Permissions', $r, 200);
}

// ============ CONTENT: EMOTIONS ============
echo "\n[CONTENT: EMOTIONS]\n";
$r = request('GET', "$baseUrl/endpoint/admin/content/emotions", null, $headers);
test('List Emotions', $r, 200);

$r = request('POST', "$baseUrl/endpoint/admin/content/emotions", [
    'name' => 'Test Emotion CRUD', 'icon' => 'X', 'description' => 'Test', 'category' => 'positif'
], $headers);
test('Create Emotion', $r, 201);
$emotionId = $r['body']['data']['id'] ?? null;

if ($emotionId) {
    $r = request('PUT', "$baseUrl/endpoint/admin/content/emotions/$emotionId", ['name' => 'Emotion Updated'], $headers);
    test('Update Emotion', $r, 200);

    $r = request('DELETE', "$baseUrl/endpoint/admin/content/emotions/$emotionId", null, $headers);
    test('Delete Emotion', $r, 200);
}

// ============ CONTENT: CONTEXTS ============
echo "\n[CONTENT: CONTEXTS]\n";
$r = request('GET', "$baseUrl/endpoint/admin/content/contexts", null, $headers);
test('List Contexts', $r, 200);

$r = request('POST', "$baseUrl/endpoint/admin/content/contexts", ['name' => 'Test Context CRUD', 'description' => 'Test'], $headers);
test('Create Context', $r, 201);
$contextId = $r['body']['data']['id'] ?? null;

if ($contextId) {
    $r = request('PUT', "$baseUrl/endpoint/admin/content/contexts/$contextId", ['name' => 'Context Updated'], $headers);
    test('Update Context', $r, 200);

    $r = request('DELETE', "$baseUrl/endpoint/admin/content/contexts/$contextId", null, $headers);
    test('Delete Context', $r, 200);
}

// ============ CONTENT: QURAN ============
echo "\n[CONTENT: QURAN]\n";
$r = request('GET', "$baseUrl/endpoint/admin/content/quran", null, $headers);
test('List Quran', $r, 200);

$r = request('POST', "$baseUrl/endpoint/admin/content/quran", [
    'surah' => 2, 'ayat_number' => 255, 'arabic_text' => 'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ',
    'translation' => 'Allah, tidak ada tuhan selain Dia', 'source' => 'QS. Al-Baqarah: 255'
], $headers);
test('Create Quran Verse', $r, 201);
$quranId = $r['body']['data']['id'] ?? null;

if ($quranId) {
    $r = request('PUT', "$baseUrl/endpoint/admin/content/quran/$quranId", ['translation' => 'Updated'], $headers);
    test('Update Quran Verse', $r, 200);

    $r = request('PUT', "$baseUrl/endpoint/admin/content/quran/$quranId/review", ['status' => 'published'], $headers);
    test('Review Quran Verse', $r, 200);

    $r = request('DELETE', "$baseUrl/endpoint/admin/content/quran/$quranId", null, $headers);
    test('Delete Quran Verse', $r, 200);
}

// ============ CONTENT: HADITH ============
echo "\n[CONTENT: HADITH]\n";
$r = request('GET', "$baseUrl/endpoint/admin/content/hadith", null, $headers);
test('List Hadith', $r, 200);

$r = request('POST', "$baseUrl/endpoint/admin/content/hadith", [
    'translation' => 'Actions are by intentions', 'book' => 'Sahih Bukhari',
    'number' => 1, 'narrator' => 'Umar', 'source' => 'HR. Bukhari No. 1'
], $headers);
test('Create Hadith', $r, 201);
$hadithId = $r['body']['data']['id'] ?? null;

if ($hadithId) {
    $r = request('PUT', "$baseUrl/endpoint/admin/content/hadith/$hadithId", ['translation' => 'Updated'], $headers);
    test('Update Hadith', $r, 200);

    $r = request('PUT', "$baseUrl/endpoint/admin/content/hadith/$hadithId/review", ['status' => 'published'], $headers);
    test('Review Hadith', $r, 200);

    $r = request('DELETE', "$baseUrl/endpoint/admin/content/hadith/$hadithId", null, $headers);
    test('Delete Hadith', $r, 200);
}

// ============ CAMPAIGNS ============
echo "\n[CAMPAIGNS]\n";
$r = request('GET', "$baseUrl/endpoint/admin/campaigns", null, $headers);
test('List Campaigns', $r, 200);

// Create sponsor first
$db = new mysqli('localhost', 'root', '', 'refleksi_db');
$db->query("INSERT INTO sponsors (name, contact_name, status, created_at, updated_at) VALUES ('Test Sponsor', 'Sponsor Budi', 'active', NOW(), NOW())");
$sponsorId = $db->insert_id;
$db->close();

$r = request('POST', "$baseUrl/endpoint/admin/campaigns", [
    'name' => 'Test Campaign', 'sponsor_id' => $sponsorId,
    'placement' => 'idle_screen', 'status' => 'active', 'priority' => 1,
    'valid_from' => '2026-07-25', 'valid_until' => '2026-12-31'
], $headers);
test('Create Campaign', $r, 201);
$campaignId = $r['body']['data']['id'] ?? null;

if ($campaignId) {
    $r = request('GET', "$baseUrl/endpoint/admin/campaigns/$campaignId", null, $headers);
    test('Show Campaign', $r, 200);

    $r = request('PUT', "$baseUrl/endpoint/admin/campaigns/$campaignId", ['name' => 'Campaign Updated'], $headers);
    test('Update Campaign', $r, 200);

    $r = request('DELETE', "$baseUrl/endpoint/admin/campaigns/$campaignId", null, $headers);
    test('Delete Campaign', $r, 200);
}

// ============ DONATIONS ============
echo "\n[DONATIONS]\n";
$r = request('GET', "$baseUrl/endpoint/admin/donations", null, $headers);
test('List Donations', $r, 200);

// ============ REPORTS ============
echo "\n[REPORTS]\n";
$r = request('GET', "$baseUrl/endpoint/admin/reports/overview", null, $headers);
test('Reports Overview', $r, 200);

$r = request('GET', "$baseUrl/endpoint/admin/reports/sessions", null, $headers);
test('Reports Sessions', $r, 200);

$r = request('GET', "$baseUrl/endpoint/admin/reports/donations", null, $headers);
test('Reports Donations', $r, 200);

// ============ AUDIT ============
echo "\n[AUDIT]\n";
$r = request('GET', "$baseUrl/endpoint/admin/audit", null, $headers);
test('List Audit Logs', $r, 200);

// Cleanup
if ($tenantId) request('DELETE', "$baseUrl/endpoint/admin/tenants/$tenantId", null, $headers);

echo "\n========================================\n";
echo "  RESULTS: $passCount passed, $failCount failed\n";
echo "========================================\n";
