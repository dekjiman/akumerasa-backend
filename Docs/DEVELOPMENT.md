# Development Guide

## Prerequisites

- PHP 8.2+
- MySQL 8.x
- Composer
- Node.js (untuk frontend)

## Local Setup

### 1. Clone Repository

```bash
git clone <repository-url>
cd Refleksi-backend
```

### 2. Install Dependencies

```bash
composer install
```

### 3. Setup Environment

```bash
cp env .env
```

Edit `.env` dengan konfigurasi database Anda:

```env
database.default.hostname = localhost
database.default.database = refleksi_db
database.default.username = root
database.default.password =
```

### 4. Create Database

```bash
mysql -u root -e "CREATE DATABASE refleksi_db"
```

### 5. Run Migrations

```bash
php spark migrate
```

### 6. Start Development Server

```bash
php spark serve --port 8080
```

API tersedia di `http://localhost:8080/`

## Coding Standards

### File Size Limits

- Controller: max 1000 baris
- Service: max 800 baris
- Model: max 300 baris
- Route: max 200 baris

### Separation of Concerns

```
Controller → Service → Repository → Model
```

### Naming Conventions

- Controller: `PascalCase` (contoh: `Tenants.php`)
- Method: `camelCase` (contoh: `createTenant()`)
- Table: `snake_case` (contoh: `reflection_sessions`)
- Column: `snake_case` (contoh: `created_at`)

## Project Structure

```
Refleksi-backend/
├── app/                          # Core CI4 files
├── Sites/
│   └── Endpoint/
│       ├── Config/
│       │   └── Routes.php       # All API routes
│       └── Controllers/
│           ├── Traits/
│           ├── Filters/
│           ├── Auth/
│           ├── Admin/
│           ├── Kiosk/
│           ├── Public/
│           └── Webhook/
├── database/
│   └── migrations/
├── Docs/
└── public/
```

## Testing

### API Testing dengan Postman

1. Import collection dari `dev-docs/postman/`
2. Login untuk mendapatkan token
3. Gunakan token untuk testing endpoints lain

### Manual Testing

```bash
# Test login
curl -X POST http://localhost:8080/endpoint/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@refleksidiri.id","password":"password"}'

# Test protected endpoint
curl -X GET http://localhost:8080/endpoint/admin/tenants \
  -H "Authorization: Bearer {token}"
```

## Git Workflow

1. Buat branch baru dari `dev`
2. Buat perubahan
3. Test perubahan
4. Commit dengan pesan yang jelas
5. Push dan buat PR ke `dev`

### Commit Message Format

```
feat: add tenant CRUD
fix: handle null response
refactor: simplify auth logic
```

## Troubleshooting

### Migration Error

```bash
php spark migrate:rollback
php spark migrate
```

### JWT Error

Pastikan `JWT_SECRET` di `.env` sudah diatur dengan benar.

### Database Connection Error

Pastikan MySQL running dan kredensial di `.env` benar.
