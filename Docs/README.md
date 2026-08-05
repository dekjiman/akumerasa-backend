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

## License

MIT
