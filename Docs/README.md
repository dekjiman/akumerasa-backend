# Refleksi Diri Backend API

## Overview

Backend API untuk platform Refleksi Diri - sistem kiosk refleksi Islami berbasis multi-tenant.

## Tech Stack

- **Framework**: CodeIgniter 4.7
- **PHP**: 8.2+
- **Database**: MySQL 8.x
- **Auth**: JWT (firebase/php-jwt)

## Quick Start

### 1. Install Dependencies

```bash
cd D:\laragon\www\Refleksi-backend
composer install
```

### 2. Setup Environment

```bash
cp env .env
# Edit .env with your database credentials
```

### 3. Create Database

```sql
CREATE DATABASE refleksi_db;
```

### 4. Run Migrations

```bash
php spark migrate
```

### 5. Start Development Server

```bash
php spark serve --port 8080
```

API will be available at `http://localhost:8080/endpoint/`

## 🐳 Production Deployment (Docker Compose)

Aplikasi ini sudah terkonfigurasi menggunakan **Docker Compose** lengkap dengan **MariaDB 11.3** dan **Nginx**.

Saat pertama kali dijalankan di server produksi (`mariadb_data` masih bersih), MariaDB akan **secara otomatis mengimpor seluruh tabel dan isi data awal** dari file `data/refleksi_db.sql` (659 ayat Al-Quran, 310 Hadits, 18 Emosi, Role, Permissions, User Admin, dll).

### Langkah Deploy di Server Prod:

```bash
# 1. Clone repository
git clone <repository-url>
cd akumerasa-backend

# 2. Buat file .env dari template
cp .env.example .env

# 3. Sesuaikan JWT_SECRET, HASH_KEY, dan DB passwords di .env jika diperlukan

# 4. Jalankan Docker Compose (Build & Start)
docker compose up --build -d

# 5. Cek status container & logs database
docker compose ps
docker compose logs -f db
```

Aplikasi siap diakses di port `8080` (atau port `WEB_PORT` yang ditentukan di `.env`).

## Project Structure

```
Refleksi-backend/
├── app/                          # Core CI4 files
│   ├── Config/
│   │   └── Routes.php           # Main routes (loads modular routes)
│   └── Filters/
├── Sites/
│   └── Endpoint/
│       ├── Config/
│       │   └── Routes.php       # All API routes
│       └── Controllers/
│           ├── Traits/
│           │   └── ResponseFormat.php
│           ├── Filters/
│           │   ├── JWTFilterAuth.php
│           │   ├── KioskAuthFilter.php
│           │   └── ThrottleFilter.php
│           ├── Auth/
│           │   └── Auth.php
│           ├── Admin/
│           │   ├── Tenants.php
│           │   ├── Locations.php
│           │   ├── Kiosks.php
│           │   ├── Users.php
│           │   ├── Roles.php
│           │   ├── Content.php
│           │   ├── Campaigns.php
│           │   ├── Donations.php
│           │   ├── Reports.php
│           │   └── AuditLogs.php
│           ├── Kiosk/
│           │   ├── Kiosk.php
│           │   ├── Sessions.php
│           │   └── PrintJobs.php
│           ├── Public/
│           │   ├── QrResult.php
│           │   └── Donasi.php
│           └── Webhook/
│               └── Payment.php
├── database/
│   └── migrations/
├── Docs/                         # Documentation
└── public/
    └── index.php
```

## API Endpoints

See [API_REFERENCE.md](API_REFERENCE.md) for complete documentation.

## Authentication

See [AUTHENTICATION.md](AUTHENTICATION.md) for auth flow details.

## Kiosk App Integration

See [KIOSK_INTEGRATION.md](KIOSK_INTEGRATION.md) for Kiosk App to Backend integration documentation (Lead Submit & Reflection Flow).

## License

MIT
