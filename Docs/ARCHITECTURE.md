# Architecture

## System Overview

Refleksi Diri Backend adalah RESTful API yang dibangun dengan CodeIgniter 4, mengikuti arsitektur modular seperti fotostruk-backend-service.

## Design Principles

1. **Modular Structure**: Code disusun dalam modul berdasarkan domain (Auth, Admin, Kiosk, Public, Webhook)
2. **Multi-Tenant**: Setiap data terikat dengan tenant untuk isolasi data
3. **Role-Based Access Control (RBAC)**: Akses dikontrol berdasarkan role dan permission
4. **Offline-First**: Kiosk dapat berfungsi offline dengan data terakhir yang di-cache

## Data Flow

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”     â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”     â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚   Landing   â”‚â”€â”€â”€â”€â–¶â”‚   Backend   â”‚â—€â”€â”€â”€â”€â”‚    Admin    â”‚
â”‚  (Vue 3)    â”‚     â”‚   (CI4)     â”‚     â”‚  (Vue 3)    â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜     â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜     â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                           â”‚
                           â”‚
                    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
                    â”‚    Kiosk    â”‚
                    â”‚  (Vue 3)    â”‚
                    â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

## Authentication Flow

### User Auth (Admin)
1. User login dengan email/password
2. Backend generate JWT access token + refresh token
3. Token disimpan di database (user_sessions)
4. Semua request dilindungi dengan JWT filter

### Device Auth (Kiosk)
1. Kiosk register dengan kiosk_code + device_secret
2. Backend generate device token (1 tahun expiry)
3. Token disimpan di database (kiosk_tokens)
4. Semua request kiosk dilindungi dengan kioskAuth filter

## Database Schema

Lihat [DATABASE.md](DATABASE.md) untuk detail schema.

## Security

- Password di-hash dengan bcrypt + salt
- JWT tokens dapat di-revoke
- Rate limiting pada endpoint publik
- CORS dikonfigurasi untuk cross-origin requests
- Input validation pada semua endpoint

