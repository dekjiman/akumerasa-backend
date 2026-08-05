# Database Schema

## Overview

Database menggunakan MySQL 8.x dengan structure multi-tenant.

## Tables

### users
Tabel untuk menyimpan data pengguna admin.

| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto increment |
| name | VARCHAR(255) | Nama pengguna |
| email | VARCHAR(255) | Email (unique) |
| password_hash | VARCHAR(255) | Bcrypt password hash |
| role | VARCHAR(50) | Role pengguna |
| tenant_id | INT | ID tenant (nullable) |
| status | VARCHAR(20) | Status: active, inactive |
| login_attempts | INT | Jumlah percobaan login |
| locked_until | DATETIME | Akun terkunci sampai |
| created_at | DATETIME | Waktu pembuatan |
| updated_at | DATETIME | Waktu update |
| deleted_at | DATETIME | Soft delete |

### tenants
Tabel untuk menyimpan data tenant/yayasan.

| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto increment |
| name | VARCHAR(255) | Nama tenant |
| slug | VARCHAR(255) | URL slug (unique) |
| contact_name | VARCHAR(255) | Nama kontak |
| contact_email | VARCHAR(255) | Email kontak |
| phone | VARCHAR(50) | Nomor telepon |
| address | TEXT | Alamat |
| status | VARCHAR(20) | Status: active, inactive |
| settings | JSON | Pengaturan tenant |
| created_at | DATETIME | Waktu pembuatan |
| updated_at | DATETIME | Waktu update |
| deleted_at | DATETIME | Soft delete |

### locations
Tabel untuk menyimpan data lokasi/masjid.

| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto increment |
| tenant_id | INT (FK) | ID tenant |
| name | VARCHAR(255) | Nama lokasi |
| address | TEXT | Alamat |
| city | VARCHAR(100) | Kota |
| province | VARCHAR(100) | Provinsi |
| latitude | DECIMAL(10,8) | Latitude |
| longitude | DECIMAL(11,8) | Longitude |
| status | VARCHAR(20) | Status: active, inactive |
| created_at | DATETIME | Waktu pembuatan |
| updated_at | DATETIME | Waktu update |
| deleted_at | DATETIME | Soft delete |

### kiosks
Tabel untuk menyimpan data perangkat kiosk.

| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto increment |
| location_id | INT (FK) | ID lokasi |
| tenant_id | INT (FK) | ID tenant |
| kiosk_code | VARCHAR(50) | Kode kiosk (unique) |
| device_secret_hash | VARCHAR(255) | Hash device secret |
| app_version | VARCHAR(20) | Versi aplikasi |
| status | VARCHAR(20) | Status: active, inactive, suspended |
| printer_status | VARCHAR(20) | Status printer |
| last_seen | DATETIME | Terakhir aktif |
| created_at | DATETIME | Waktu pembuatan |
| updated_at | DATETIME | Waktu update |
| deleted_at | DATETIME | Soft delete |

### emotions
Tabel untuk menyimpan data emosi.

| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto increment |
| name | VARCHAR(100) | Nama emosi |
| icon | VARCHAR(10) | Emoji icon |
| description | TEXT | Deskripsi |
| category | VARCHAR(50) | Kategori: positif, tidak_nyaman |
| status | VARCHAR(20) | Status: active, inactive |
| sort_order | INT | Urutan |
| created_at | DATETIME | Waktu pembuatan |
| updated_at | DATETIME | Waktu update |

### quran_verses
Tabel untuk menyimpan data ayat Al-Qur'an.

| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto increment |
| surah | INT | Nomor surah |
| ayat_number | INT | Nomor ayat |
| arabic_text | TEXT | Teks Arab |
| translation | TEXT | Terjemahan |
| source | VARCHAR(100) | Sumber |
| tags | VARCHAR(255) | Tag |
| status | VARCHAR(20) | Status: draft, approved, rejected |
| reviewer_id | INT | ID reviewer |
| reviewed_at | DATETIME | Waktu review |
| created_at | DATETIME | Waktu pembuatan |
| updated_at | DATETIME | Waktu update |

### reflection_sessions
Tabel untuk menyimpan sesi refleksi.

| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto increment |
| kiosk_id | INT (FK) | ID kiosk |
| location_id | INT (FK) | ID lokasi |
| tenant_id | INT (FK) | ID tenant |
| visitor_name | VARCHAR(255) | Nama pengunjung |
| visitor_email | VARCHAR(255) | Email pengunjung |
| emotion_id | INT (FK) | ID emosi |
| context_id | INT (FK) | ID konteks |
| cause_id | VARCHAR(100) | ID penyebab |
| story | TEXT | Cerita opsional |
| status | VARCHAR(20) | Status: in_progress, completed |
| created_at | DATETIME | Waktu pembuatan |
| updated_at | DATETIME | Waktu update |

### reflection_results
Tabel untuk menyimpan hasil refleksi.

| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto increment |
| session_id | INT (FK) | ID sesi |
| token | VARCHAR(64) | Token QR (unique) |
| verse_id | INT (FK) | ID ayat |
| hadith_id | INT (FK) | ID hadis |
| advice | TEXT | Saran |
| reflection_guide | TEXT | Panduan refleksi |
| printed | BOOLEAN | Sudah dicetak |
| created_at | DATETIME | Waktu pembuatan |

### donations
Tabel untuk menyimpan data donasi.

| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto increment |
| session_id | INT (FK) | ID sesi |
| amount | DECIMAL(12,2) | Jumlah donasi |
| payment_method | VARCHAR(50) | Metode pembayaran |
| reference | VARCHAR(100) | Referensi (unique) |
| status | VARCHAR(20) | Status: pending, paid, expired, failed |
| paid_at | DATETIME | Waktu pembayaran |
| created_at | DATETIME | Waktu pembuatan |
| updated_at | DATETIME | Waktu update |

### campaigns
Tabel untuk menyimpan data kampanye sponsor.

| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto increment |
| sponsor_id | INT (FK) | ID sponsor |
| name | VARCHAR(255) | Nama kampanye |
| description | TEXT | Deskripsi |
| creative_url | VARCHAR(500) | URL kreatif |
| placement | VARCHAR(50) | Posisi: idle_screen, completion_screen |
| target_config | JSON | Konfigurasi target |
| schedule_config | JSON | Konfigurasi jadwal |
| priority | INT | Prioritas |
| weight | INT | Bobot |
| status | VARCHAR(20) | Status: draft, active, paused |
| valid_from | DATETIME | Berlaku dari |
| valid_until | DATETIME | Berlaku sampai |
| created_at | DATETIME | Waktu pembuatan |
| updated_at | DATETIME | Waktu update |
| deleted_at | DATETIME | Soft delete |

### audit_logs
Tabel untuk menyimpan log audit.

| Column | Type | Description |
|--------|------|-------------|
| id | INT (PK) | Auto increment |
| user_id | INT | ID pengguna |
| action | VARCHAR(50) | Aksi yang dilakukan |
| resource_type | VARCHAR(50) | Tipe resource |
| resource_id | VARCHAR(100) | ID resource |
| old_data | JSON | Data sebelum perubahan |
| new_data | JSON | Data sesudah perubahan |
| ip_address | VARCHAR(45) | IP address |
| user_agent | VARCHAR(500) | User agent |
| created_at | DATETIME | Waktu pembuatan |
