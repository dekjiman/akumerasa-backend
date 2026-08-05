<?php
// Manual migration script
$host = 'localhost';
$user = 'root';
$pass = '';
$db = 'refleksi_db';

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Create missing tables manually
$sqls = [
    // kiosk_tokens
    "CREATE TABLE IF NOT EXISTS kiosk_tokens (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        kiosk_id INT UNSIGNED NOT NULL,
        token_hash VARCHAR(64) NOT NULL,
        expires_at DATETIME NOT NULL,
        revoked_at DATETIME NULL,
        created_at DATETIME NOT NULL,
        KEY idx_kiosk_id (kiosk_id),
        KEY idx_token_hash (token_hash)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // user_sessions
    "CREATE TABLE IF NOT EXISTS user_sessions (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_id INT UNSIGNED NOT NULL,
        token_hash VARCHAR(64) NOT NULL,
        refresh_token_hash VARCHAR(64) NOT NULL,
        device_fingerprint VARCHAR(255) NULL,
        expires_at DATETIME NOT NULL,
        revoked_at DATETIME NULL,
        created_at DATETIME NOT NULL,
        KEY idx_user_id (user_id),
        KEY idx_token_hash (token_hash)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // kiosk_heartbeats
    "CREATE TABLE IF NOT EXISTS kiosk_heartbeats (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        kiosk_id INT UNSIGNED NOT NULL,
        storage_used INT NULL,
        network_status VARCHAR(20) DEFAULT 'online',
        printer_state VARCHAR(50) NULL,
        created_at DATETIME NOT NULL,
        KEY idx_kiosk_id (kiosk_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // donations
    "CREATE TABLE IF NOT EXISTS donations (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        session_id INT UNSIGNED NULL,
        amount DECIMAL(12,2) NOT NULL,
        payment_method VARCHAR(50) DEFAULT 'qris',
        reference VARCHAR(100) UNIQUE NOT NULL,
        qr_data TEXT NULL,
        status VARCHAR(20) DEFAULT 'pending',
        provider_ref VARCHAR(255) NULL,
        paid_at DATETIME NULL,
        created_at DATETIME NOT NULL,
        updated_at DATETIME NOT NULL,
        KEY idx_session_id (session_id),
        KEY idx_reference (reference),
        KEY idx_status (status)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // payment_webhooks
    "CREATE TABLE IF NOT EXISTS payment_webhooks (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        donation_id INT UNSIGNED NOT NULL,
        provider VARCHAR(50) NOT NULL,
        payload JSON NOT NULL,
        signature VARCHAR(255) NULL,
        processed_at DATETIME NOT NULL,
        created_at DATETIME NOT NULL,
        KEY idx_donation_id (donation_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // sponsors
    "CREATE TABLE IF NOT EXISTS sponsors (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        contact_name VARCHAR(255) NULL,
        contact_email VARCHAR(255) NULL,
        phone VARCHAR(50) NULL,
        status VARCHAR(20) DEFAULT 'active',
        created_at DATETIME NOT NULL,
        updated_at DATETIME NOT NULL,
        deleted_at DATETIME NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // campaigns
    "CREATE TABLE IF NOT EXISTS campaigns (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        sponsor_id INT UNSIGNED NOT NULL,
        name VARCHAR(255) NOT NULL,
        description TEXT NULL,
        creative_url VARCHAR(500) NULL,
        placement VARCHAR(50) DEFAULT 'idle_screen',
        target_config JSON NULL,
        schedule_config JSON NULL,
        priority INT DEFAULT 0,
        weight INT DEFAULT 1,
        status VARCHAR(20) DEFAULT 'draft',
        valid_from DATETIME NULL,
        valid_until DATETIME NULL,
        created_at DATETIME NOT NULL,
        updated_at DATETIME NOT NULL,
        deleted_at DATETIME NULL,
        KEY idx_sponsor_id (sponsor_id),
        KEY idx_status (status)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // campaign_plays
    "CREATE TABLE IF NOT EXISTS campaign_plays (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        campaign_id INT UNSIGNED NOT NULL,
        kiosk_id INT UNSIGNED NOT NULL,
        placement VARCHAR(50) NOT NULL,
        started_at DATETIME NULL,
        completed_at DATETIME NULL,
        duration_ms INT NULL,
        KEY idx_campaign_id (campaign_id),
        KEY idx_kiosk_id (kiosk_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // audit_logs
    "CREATE TABLE IF NOT EXISTS audit_logs (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_id INT UNSIGNED NULL,
        action VARCHAR(50) NOT NULL,
        resource_type VARCHAR(50) NOT NULL,
        resource_id VARCHAR(100) NULL,
        old_data JSON NULL,
        new_data JSON NULL,
        ip_address VARCHAR(45) NULL,
        user_agent VARCHAR(500) NULL,
        created_at DATETIME NOT NULL,
        KEY idx_user_id (user_id),
        KEY idx_action (action),
        KEY idx_resource_type (resource_type),
        KEY idx_created_at (created_at)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // roles
    "CREATE TABLE IF NOT EXISTS roles (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50) UNIQUE NOT NULL,
        description VARCHAR(255) NULL,
        created_at DATETIME NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // role_permissions
    "CREATE TABLE IF NOT EXISTS role_permissions (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        role_id INT UNSIGNED NOT NULL,
        permission VARCHAR(100) NOT NULL,
        created_at DATETIME NOT NULL,
        KEY idx_role_id (role_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // print_jobs
    "CREATE TABLE IF NOT EXISTS print_jobs (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        session_id INT UNSIGNED NOT NULL,
        result_id INT UNSIGNED NOT NULL,
        kiosk_id INT UNSIGNED NOT NULL,
        status VARCHAR(20) DEFAULT 'pending',
        retry_count INT DEFAULT 0,
        error_message TEXT NULL,
        completed_at DATETIME NULL,
        created_at DATETIME NOT NULL,
        updated_at DATETIME NOT NULL,
        KEY idx_session_id (session_id),
        KEY idx_kiosk_id (kiosk_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // reflection_results (if not exists)
    "CREATE TABLE IF NOT EXISTS reflection_results (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        session_id INT UNSIGNED NOT NULL,
        token VARCHAR(64) UNIQUE NOT NULL,
        verse_id INT UNSIGNED NULL,
        hadith_id INT UNSIGNED NULL,
        advice TEXT NULL,
        reflection_guide TEXT NULL,
        printed BOOLEAN DEFAULT false,
        created_at DATETIME NOT NULL,
        KEY idx_session_id (session_id),
        KEY idx_token (token)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",
];

foreach ($sqls as $sql) {
    if ($conn->query($sql) === TRUE) {
        echo "OK\n";
    } else {
        echo "Error: " . $conn->error . "\n";
    }
}

$conn->close();
echo "All tables created successfully!";
